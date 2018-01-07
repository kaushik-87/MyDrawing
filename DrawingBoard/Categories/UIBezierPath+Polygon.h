//
//  UIBezierPath+Polygon.h
//  DrawingBoard
//
//  Created by Admin on 12/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSimpleRegularPolygon.h"

@interface UIBezierPath (Polygon)
/*
 * Constructs the CGPath for the provided polygon in side a specific view. The polygon is drawn with refernce to the centre of the view.
 *@param polygon object which is of the type DBSimpleRegularPolygin.
 *@param inRect which is of the tyoe CGRect inside which the path to be drawn.
 *@return path to be drawn which is of the type CGPathRef.
 */
+ (CGPathRef)pathForPolygon:(DBSimpleRegularPolygon*)polygon inRect:(CGRect)rect;
@end
