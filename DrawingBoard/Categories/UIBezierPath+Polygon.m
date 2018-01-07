//
//  UIBezierPath+Polygon.m
//  DrawingBoard
//
//  Created by Admin on 12/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "UIBezierPath+Polygon.h"

@implementation UIBezierPath (Polygon)

+ (CGPathRef)pathForPolygon:(DBSimpleRegularPolygon*)polygon inRect:(CGRect)rect{
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    int width = rect.size.width;
    int height = rect.size.height;
    
    CGPoint centre = CGPointMake(width/2, height/2);
    CGFloat angle = (CGFloat)( M_PI / 2.0 );
    CGFloat angleCounter = [polygon internalAngel];
 
    CGPoint initialPoint = CGPointMake(polygon.radius *cosf(angle) + centre.x  , polygon.radius*sinf(angle) + centre.y );
    CGPathMoveToPoint(pathRef, NULL, initialPoint.x, initialPoint.y);
    
    for (int i=0;i<[polygon numberOfSides];i++){
        CGPoint point = CGPointMake(polygon.radius *cosf(angle) + centre.x , polygon.radius*sinf(angle) + centre.y);
        angle = angle+angleCounter;
        CGPathAddLineToPoint(pathRef, NULL, point.x, point.y);
    }
    
    CGPathAddLineToPoint(pathRef, NULL, initialPoint.x, initialPoint.y);
    return pathRef;
}
@end

