//
//  UIColor+Random.m
//  DrawingBoard
//
//  Created by Admin on 12/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)
+ (UIColor *)randomColor
{
    int min = 1;
    int max = 10;
    int random = (int)(min + arc4random_uniform((uint32_t)(max - min + 1)));
    UIColor *color;
    switch (random) {
        case 1:
            color = [UIColor yellowColor];
            break;
        case 2:
            color = [UIColor grayColor];
            break;
        case 3:
            color = [UIColor greenColor];
            break;
        case 4:
            color = [UIColor redColor];
            break;
        case 5:
            color = [UIColor brownColor];
            break;
        case 6:
            color = [UIColor orangeColor];
            break;
        case 7:
            color = [UIColor purpleColor];
            break;
        case 8:
            color = [UIColor magentaColor];
            break;
        case 9:
            color = [UIColor darkGrayColor];
            break;
        default:
            color = [UIColor blueColor];
            break;
    }
    return color;
}
@end
