//
//  DBUtility.m
//  DrawingBoard
//
//  Created by Admin on 12/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DBUtility.h"

@implementation DBUtility
+ (NSUInteger)randomNumberOfSidesFrom:(NSUInteger)min toMax:(NSUInteger)max
{
    return min + arc4random_uniform((uint32_t)(max - min + 1));
}
@end
