//
//  YQHPicTxtCell.h
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtModel.h"
#import "YQHPicTxtToolBar.h"

@protocol YQHPicTxtToolImageDelegate <NSObject>

@optional
- (void)imageClicked:(int)index  model:(YQHPicTxtModel *)model  view:(UIView*)view;

@end

@interface YQHPicTxtCell : UITableViewCell

@property (nonatomic, strong) YQHPicTxtModel* model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)cellHeightWithModel:(YQHPicTxtModel*)model;

@property (nonatomic, strong) YQHPicTxtToolBar* bottomToolBar;

- (void)setDelegate:(id<YQHPicTxtToolBarDelegate>)delegate row:(NSIndexPath*)indexPath;

@property (nonatomic , weak) id<YQHPicTxtToolImageDelegate>imageDelegate;

@end
