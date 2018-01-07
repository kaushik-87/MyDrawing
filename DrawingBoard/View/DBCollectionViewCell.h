//
//  DBCollectionViewCell.h
//  DrawingBoard
//
//  Created by Admin on 12/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSimpleRegularPolygon.h"

@protocol DBCollectionViewCellDelegate;
@interface DBCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) NSObject<DBCollectionViewCellDelegate> *delegate;
- (void)setPolygon:(DBSimpleRegularPolygon*)polygon;
- (void)startRotateCanvas:(BOOL)clockwise completionHandler:(void (^)(BOOL completed))completionBlock;
- (void)stopRotateCanvasWithCompletionHandler:(void (^)(BOOL completed))completionBlock;

@end
