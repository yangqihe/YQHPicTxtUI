//
//  YQHPicTxtImageViewCell.m
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtImageViewCell.h"
#import "YQHPicTxtImageView1.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtImageViewCell()

@property (nonatomic, strong)  YQHPicTxtImageView1* view;

@end

@implementation YQHPicTxtImageViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"YQHPicTxtImageViewCell";
    YQHPicTxtImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor=[UIColor clearColor];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self initLayout];
    }
    
    return self;
}

- (void)initLayout
{
    self.view=[YQHPicTxtImageView1 new];
    [self.contentView addSubview:self.view];
    
    self.view.imageView.image=[UIImage imageNamed:@"icon_user_parents_def"];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(42*WidthScale));
        make.height.equalTo(@(60*WidthScale));
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-8);
    }];
    
    //self.view.backgroundColor=[UIColor grayColor];
    
    self.view.transform=CGAffineTransformMakeRotation(M_PI / 2);
    
    self.view.label.text=@"小明";
}

@end
