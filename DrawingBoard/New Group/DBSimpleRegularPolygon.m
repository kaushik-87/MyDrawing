//
//  DBSimpleRegularPolygon.m
//  DrawingBoard
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBSimpleRegularPolygon.h"
@interface DBSimpleRegularPolygon ()
@property (nonatomic, assign) CGPathRef pathRef;
@property (nonatomic, assign) NSUInteger numOfSides;

@end
@implementation DBSimpleRegularPolygon

- (void)setSides:(NSUInteger)sides error:(NSError **)error
{
    if (sides <=2) {
        if (error != NULL) {
            NSString *description = NSLocalizedString(@"A regular polygon should contain minimum of 3 sides", @"Minimum size error");
            int errCode = 1001;
            // Create and return the custom domain error.
            NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey : description};
            
            *error = [[NSError alloc] initWithDomain:@"com.drawingboard.polygon"
                                                  code:errCode userInfo:errorDictionary];
        }
        return;
    }

    self.numOfSides = sides;
}

- (NSUInteger)numberOfSides
{
    return self.numOfSides;
}

- (CGFloat)internalAngel
{
    return (CGFloat) M_PI * 2.0 / _numOfSides;
}
- (CGFloat)externalAngel
{
    return 180 - [self internalAngel];
}
- (CGFloat)angelBetweenTwoVertices
{
    return 360 - [self internalAngel];
}
@end
