//
//  DBCollectionViewCell.m
//  DrawingBoard
//
//  Created by Admin on 12/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBCollectionViewCell.h"
#import "DBCanvasView.h"
#import "DBCollectionViewCellDelegate.h"

@interface DBCollectionViewCell()
@property (weak,  nonatomic) IBOutlet DBCanvasView  *polygonView;
@property (nonatomic,retain) DBSimpleRegularPolygon *polygon;

@end
@implementation DBCollectionViewCell

- (void)setPolygon:(DBSimpleRegularPolygon*)polygon
{
    _polygon = polygon;
    [_polygon setRadius:self.polygonView.frame.size.width/2];
    [self.polygonView drawPolygon:_polygon];
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleSingleTap:)];
    [self.polygonView addGestureRecognizer:singleFingerTap];
}

- (void)startRotateCanvas:(BOOL)clockwise completionHandler:(void (^)(BOOL completed))completionBlock
{
    [self.polygonView startRotationAnimation:clockwise completionHandler:completionBlock];
}

- (void)stopRotateCanvasWithCompletionHandler:(void (^)(BOOL completed))completionBlock
{
    [self.polygonView stopRotationAnimationWithcompletionHandler:completionBlock];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
     if ([self.delegate respondsToSelector:@selector(dbCollectionViewCell:didTapOnPolygon:)]) {
       [self.delegate dbCollectionViewCell:self didTapOnPolygon:self.polygon];
     }
}

@end
