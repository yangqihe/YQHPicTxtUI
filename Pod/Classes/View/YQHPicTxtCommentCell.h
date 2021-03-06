//
//  YQHPicTxtCommentCell.h
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtCommentModel.h"

#define commentTxtFont [UIFont fontWithName:@"PingFangSC-Regular" size:12*WidthScale]


@protocol YQHPicTxtCommentCellDelegate <NSObject>

@optional

-(void)didSelectModel:(YQHPicTxtCommentModel *)picTxtCommentModel;

@end

@interface YQHPicTxtCommentCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)cellHeightWithModel:(YQHPicTxtCommentModel*)model;

@property (nonatomic, strong) YQHPicTxtCommentModel *model;

@property (nonatomic, weak)  <YQHPicTxtCommentCellDelegate> delegate;

@end
