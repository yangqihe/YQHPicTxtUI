//
//  YQHPicTxtToolBar1.h
//  AFNetworking
//
//  Created by 杨棋贺 on 2019/6/6.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtToolBar.h"

@interface YQHPicTxtToolBar1 : UIView


@property (nonatomic , weak) id<YQHPicTxtToolBarDelegate>delegate;

@property (nonatomic, weak) NSIndexPath* indexPath;

@property (nonatomic)  int favorCount;

@property (nonatomic)  int commontCount;

@property (nonatomic)  BOOL isFavor;

@property (nonatomic)  BOOL isCollected;

@end

