//
//  YQHPicTxtCell1.h
//  AFNetworking
//
//  Created by 杨棋贺 on 2019/6/6.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtCell.h"

#import "YQHPicTxtModel.h"
#import "YQHPicTxtCommentModel.h"
#import "YQHPicTxtToolBar1.h"


@interface YQHPicTxtCell1 : UITableViewCell

@property (nonatomic, strong) YQHPicTxtModel* model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+(CGFloat)calImageSize:(YQHPicTxtModel*)model;

+ (CGFloat)cellHeightWithModel:(YQHPicTxtModel*)model;

@property (nonatomic, strong) YQHPicTxtToolBar1* bottomToolBar;

- (void)setDelegate:(id<YQHPicTxtToolBarDelegate>)delegate row:(NSIndexPath*)indexPath;

@property (nonatomic , weak) id<YQHPicTxtToolImageDelegate>imageDelegate;

@property (nonatomic , weak) id<YQHPicTxtCommentDelegate>commentDelegate;

@end

