//
//  DBCanvasView.m
//  DrawingBoard
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBCanvasView.h"
#import "UIBezierPath+Polygon.h"
#import <QuartzCore/QuartzCore.h>

#define kRotationAnimationKey  @"rotationAnimation"
@interface DBCanvasView()
@property (nonatomic, retain)UIBezierPath            *drawingPath;
@property (nonatomic, retain)DBSimpleRegularPolygon  *polygon;
@property (nonatomic, strong)CAShapeLayer            *polygonShapeLayer;
@end
@implementation DBCanvasView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.polygonShapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.polygonShapeLayer.fillColor = self.polygon.color.CGColor;
}

- (void)drawPolygon:(DBSimpleRegularPolygon*)polygon
{
    self.polygon = polygon;
    //Remove the existing polygon layer incase we need to redraw in the same canvas.
    [self.polygonShapeLayer removeFromSuperlayer];
    self.polygonShapeLayer = nil;
    [self setNeedsDisplay];
}


- (void)startRotationAnimation:(BOOL)isClockwise completionHandler:(void (^)(BOOL completed))completionBlock
{
    [self startRotationAnimation:isClockwise];
    if(completionBlock){
        completionBlock(YES);
    }
}

//Rotation can be set either clockwise or anticlockwise.
- (void)startRotationAnimation:(BOOL)isClockwise
{
    CGFloat rotationAngle = isClockwise ? M_PI : (M_PI - M_PI * 2.0);
    CABasicAnimation* rotationAnimation;
    rotationAnimation               = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue       = [NSNumber numberWithFloat:rotationAngle];
    rotationAnimation.duration      = .5;
    rotationAnimation.cumulative    = YES;
    rotationAnimation.repeatCount   = 2;
    [self.polygonShapeLayer addAnimation:rotationAnimation forKey:kRotationAnimationKey];
}

- (void)stopRotationAnimationWithcompletionHandler:(void (^)(BOOL completed))completionBlock
{
    [self stopRotationAnimation];
    if (completionBlock) {
        completionBlock(YES);
    }
}

- (void)stopRotationAnimation
{
    [self.polygonShapeLayer removeAnimationForKey:kRotationAnimationKey];
}

-(CAShapeLayer *)polygonShapeLayer {
    
    if (_polygonShapeLayer == nil) {
        _polygonShapeLayer = [CAShapeLayer layer];
        _polygonShapeLayer.frame         = self.bounds;
        _polygonShapeLayer.masksToBounds = YES;
        _polygonShapeLayer.cornerRadius  = 0.5;
        _polygonShapeLayer.path          = [UIBezierPath pathForPolygon:self.polygon inRect:self.bounds];
        [self.layer addSublayer:_polygonShapeLayer];
    }
    return _polygonShapeLayer;
}


@end
