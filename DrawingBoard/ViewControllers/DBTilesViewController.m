//
//  DBTilesViewController.m
//  DrawingBoard
//
//  Created by Admin on 12/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBTilesViewController.h"
#import "DBSimpleRegularPolygon.h"
#import "DBCollectionViewCell.h"
#import "DBCollectionViewCellDelegate.h"
#import "UIColor+Random.h"

#define kNumberOfPolygons 80
@interface DBTilesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DBCollectionViewCellDelegate>
@property (nonatomic, retain)   NSMutableArray              *tiles;
@property (nonatomic, retain)   NSMutableArray              *currentSet;
@property (weak,   nonatomic)   IBOutlet UICollectionView   *tilesView;
- (void)customInitialization;
@end

@implementation DBTilesViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customInitialization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInitialization];
    }
    return self;
}

- (void)customInitialization
{
    _currentSet = [[NSMutableArray alloc]init];
    _tiles      = [[NSMutableArray alloc]init];
    [self constructDataSource];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tilesView reloadData];
}

- (void)constructDataSource {
    for(int j=0;j<kNumberOfPolygons;j++){
            DBSimpleRegularPolygon *polygon = [[DBSimpleRegularPolygon alloc] init];
            NSError *error;
            [polygon setSides:[self randomNumberBetween:3 maxNumber:8] error:&error];
            if(error){
                NSLog(@"Recevied Error %@",error);
            }else{
                [polygon setColor:[UIColor randomColor]];
                [_tiles addObject:polygon];
            }
        }
}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random_uniform((uint32_t)(max - min + 1));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CollectionviewDatasource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    DBCollectionViewCell   *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DBCollectionViewCell" forIndexPath:indexPath];
    DBSimpleRegularPolygon *polygon = [self.tiles objectAtIndex:indexPath.row];
    [cell setPolygon:polygon];
    [cell setDelegate:self];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _tiles.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - Collectionview cell delegate

- (void)dbCollectionViewCell:(DBCollectionViewCell *)cell didTapOnPolygon:(DBSimpleRegularPolygon *)polygon {
    
    CGPoint centreOfCell = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
    CGPoint leftPoint = CGPointMake(centreOfCell.x - cell.frame.size.width, centreOfCell.y);
    CGPoint rightPoint = CGPointMake(centreOfCell.x + cell.frame.size.width, centreOfCell.y);
    CGPoint topPoint = CGPointMake(centreOfCell.x, centreOfCell.y - cell.frame.size.height);
    CGPoint bottomPoint = CGPointMake(centreOfCell.x, centreOfCell.y + cell.frame.size.height);

    NSIndexPath *indexPath = [self.tilesView indexPathForCell:cell];
    NSIndexPath *leftIndexPath = [self.tilesView indexPathForItemAtPoint:leftPoint];
    NSIndexPath *rightIndexPath = [self.tilesView indexPathForItemAtPoint:rightPoint];
    NSIndexPath *bottomIndexPath = [self.tilesView indexPathForItemAtPoint:topPoint];
    NSIndexPath *topIndexPath = [self.tilesView indexPathForItemAtPoint:bottomPoint];
    
    if (self.currentSet.count) {
        for(int i=0;i<self.currentSet.count;i++){
            DBCollectionViewCell *cell = [self.currentSet objectAtIndex:i];
            [cell stopRotateCanvasWithCompletionHandler:nil];
        }
        [self.currentSet removeAllObjects];
    }
    
    if ([self.tilesView cellForItemAtIndexPath:indexPath]) {
        [self.currentSet addObject:[self.tilesView cellForItemAtIndexPath:indexPath]];
    }
    if ([self.tilesView cellForItemAtIndexPath:leftIndexPath]) {
        [self.currentSet addObject:[self.tilesView cellForItemAtIndexPath:leftIndexPath]];
    }
    if ([self.tilesView cellForItemAtIndexPath:rightIndexPath]) {
        [self.currentSet addObject:[self.tilesView cellForItemAtIndexPath:rightIndexPath]];
    }
    if ([self.tilesView cellForItemAtIndexPath:bottomIndexPath]) {
        [self.currentSet addObject:[self.tilesView cellForItemAtIndexPath:bottomIndexPath]];
    }
    if ([self.tilesView cellForItemAtIndexPath:topIndexPath]) {
        [self.currentSet addObject:[self.tilesView cellForItemAtIndexPath:topIndexPath]];
    }
    
    if (self.currentSet.count) {
        for(int i=0;i<self.currentSet.count;i++){
            DBCollectionViewCell *cell = [self.currentSet objectAtIndex:i];
            [cell startRotateCanvas:YES completionHandler:^(BOOL completed) {
            }];
        }
    }
    
}

@end
