//
//  DBCollectionViewCellDelegate.h
//  DrawingBoard
//
//  Created by Admin on 12/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBCollectionViewCell.h"
#import "DBSimpleRegularPolygon.h"

//The delegate method to indentify the tap on the polygon.
@protocol DBCollectionViewCellDelegate <NSObject>
- (void)dbCollectionViewCell:(DBCollectionViewCell *)cell didTapOnPolygon:(DBSimpleRegularPolygon*)polygon;
@end
