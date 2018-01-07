//
//  DBSimpleRegularPolygon.h
//  DrawingBoard
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreGraphics/CoreGraphics.h"
#import <UIKit/UIKit.h>

@interface DBSimpleRegularPolygon : NSObject
@property (nonatomic, assign) NSUInteger    radius;
@property (nonatomic, retain) UIColor       *color;
/*
 *Instance method to set the sides of the Polygon.
 *@param no of sides. For regular polygon
 *@param error object. NSError which takes refernce of the error object.
 */

//Ideally the return tyoe should be non void which takes the pointer to NSError object.
- (void)setSides:(NSUInteger)sides error:(NSError **)error;

/*
 *Returns the number of sides of the Polygon.
 */
- (NSUInteger)numberOfSides;
/*
 *Returns the internal angle between the vertex.
 */
- (CGFloat)internalAngel;
/*
 *Returns the external angle between the vertex.
 */
- (CGFloat)externalAngel;
/*
 *Returns the angle between the vertices.
 */
- (CGFloat)angelBetweenTwoVertices;
@end
