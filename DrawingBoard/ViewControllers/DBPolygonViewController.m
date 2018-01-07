//
//  ViewController.m
//  DrawingBoard
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBPolygonViewController.h"
#import "DBSimpleRegularPolygon.h"
#import "DBCanvasView.h"
#import "DBUtility.h"
#import "UIColor+Random.h"

@interface DBPolygonViewController ()
@property (nonatomic, retain) DBSimpleRegularPolygon *simplePolygon;

@end

@implementation DBPolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _simplePolygon = [[DBSimpleRegularPolygon alloc]init];
    [_simplePolygon setRadius:self.view.frame.size.width/2];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(drawPolygon) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawPolygon
{
    NSUInteger sides = [DBUtility randomNumberOfSidesFrom:3 toMax:8];
    NSError *error;
    [self.simplePolygon setSides:sides error:&error];
    [self.simplePolygon setColor:[UIColor randomColor]];
    if (!error) {
        DBCanvasView *view = (DBCanvasView*)self.view;
        [view drawPolygon:self.simplePolygon];
    }
}


@end
