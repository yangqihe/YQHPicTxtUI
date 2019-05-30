//
//  YQHPicTxtToolBar.h
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQHPicTxtToolBarDelegate <NSObject>

@optional
- (void)didToolBarBtnClicked:(int)index indexPath:(NSIndexPath *)indexPath;

@end

@interface YQHPicTxtToolBar : UIView

@property (nonatomic , weak) id<YQHPicTxtToolBarDelegate>delegate;

@property (nonatomic, weak) NSIndexPath* indexPath;


@property (nonatomic)  int favorCount;

@property (nonatomic)  int commontCount;

@property (nonatomic)  BOOL isFavor;

@property (nonatomic)  BOOL isCollected;

@end
