//
//  YQHPicTxtTitleView.m
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtTitleView.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtTitleView()

@property (nonatomic, weak)  UIView* menuIcon;

@property (nonatomic, weak)  UILabel* titleLabel;

@property (nonatomic, weak)  UILabel* subTitleLabel;

@property (nonatomic, weak)  UIImageView* arrowView;

@end

@implementation YQHPicTxtTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label1=[UILabel new];
        [self addSubview:label1];
        //label1.text = @"活动截止时间";
        label1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        label1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        self.titleLabel=label1;
        
        UIView *menuIcon1 = [UIView new];
        menuIcon1.backgroundColor= [UIColor colorWithRed:20/255.0 green:158/255.0 blue:255/255.0 alpha:1/1.0];
        menuIcon1.layer.cornerRadius=2;
        [self addSubview:menuIcon1];
        self.menuIcon=menuIcon1;
        
        UIImageView *imageView1=[UIImageView new];
        imageView1.image=[UIImage imageNamed:@"pic_txt_arrow"];
        [self addSubview:imageView1];
        self.arrowView=imageView1;
        self.arrowView.hidden=YES;
        
        UILabel *subLabel1=[UILabel new];
        [self addSubview:subLabel1];
        //subLabel1.text = @"请选择";
        subLabel1.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        subLabel1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        self.subTitleLabel=subLabel1;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(marginLeft);
        make.height.equalTo(self.mas_height);
    }];
    
    [self.menuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_left).offset(-2);
        make.height.equalTo(@10);
        make.width.equalTo(@4);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-marginRight);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-marginRight);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@8);
        make.height.equalTo(@15);
    }];
}

-(void)setTitle:(NSString *)title{
    self.titleLabel.text=title;
    
    
}

-(void)setTitle:(NSString *)title subTitle:(NSString *)subTitle{
    self.titleLabel.text=title;
    self.subTitleLabel.text=subTitle;
}

- (void)setTitle:(NSString *)title subTitleWithArrow:(NSString *)subTitle{
    self.titleLabel.text=title;
    self.subTitleLabel.text=subTitle;
    
    self.arrowView.hidden=NO;
    
    //self.arrowView.backgroundColor=[UIColor redColor];
    
    [self.arrowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@8);
    }];
    
    [self.subTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowView.mas_left).offset(-8);
    }];
}

@end
