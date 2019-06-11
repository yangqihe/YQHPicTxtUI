//
//  YQHPicTxtImageViewCell.h
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YQHPicTxtImageView1;
@interface YQHPicTxtImageViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)  YQHPicTxtImageView1* picTxtImageView1;

@property (nonatomic, strong) NSString* name;

@end
