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

@end

@implementation YQHPicTxtImageViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"YQHPicTxtImageViewCell";
    YQHPicTxtImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor=[UIColor whiteColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
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
    self.picTxtImageView1=[YQHPicTxtImageView1 new];
    [self.contentView addSubview:self.picTxtImageView1];
    
    self.picTxtImageView1.imageView.image=[UIImage imageNamed:@"icon_user_parents_def"];
    
    [self.picTxtImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(42*WidthScale));
        make.height.equalTo(@(60*WidthScale));
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-8);
    }];
    
    self.picTxtImageView1.transform=CGAffineTransformMakeRotation(M_PI / 2);
    
    self.picTxtImageView1.label.text=@"";
}

-(void)setName:(NSString *)name{
    self.picTxtImageView1.label.text=name;
}


@end
