//
//  DBCanvasView.h
//  DrawingBoard
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSimpleRegularPolygon.h"
@interface DBCanvasView : UIView

@property (nonatomic) NSUInteger sides;
@property (nonatomic) NSUInteger radius;

/*
 *Draws a polygon using bezierPath.
 *@param polygon object of the tyoe DBSimpleRegularPolygon.
 */
- (void)drawPolygon:(DBSimpleRegularPolygon*)polygon;
/*
 *Starts roatating the layer in clockwise or anticlockwise direction.
 *@param isClockwise a boolean tyoe
 *@param completionBlock which a block can be used after the rotation animation is complete.
 */
- (void)startRotationAnimation:(BOOL)isClockwise completionHandler:(void (^)(BOOL completed))completionBlock;
/*
 *Stops roatating the layer.
 *@param completionBlock which a block can be used after the rotation animation is complete.
 */
- (void)stopRotationAnimationWithcompletionHandler:(void (^)(BOOL completed))completionBlock;

@end
