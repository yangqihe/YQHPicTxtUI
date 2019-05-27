//
//  YQHPicTxtImageView1.m
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtImageView1.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtImageView1()

@end

@implementation YQHPicTxtImageView1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        
        UIImageView *imageView=[UIImageView new];
        [self addSubview:imageView];
        self.imageView=imageView;
        //self.imageView.userInteractionEnabled=YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)]];
        
        UIButton* delBtn=[UIButton new];
        [self addSubview:delBtn];
        self.delBtn=delBtn;
        [self.delBtn setBackgroundImage:[UIImage imageNamed:@"photo_del_icon"] forState:UIControlStateNormal];
        [self.delBtn addTarget:self action:@selector(imageDelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label=[UILabel new];
        label.textAlignment=NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10.5*WidthScale];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self addSubview:label];
        self.label=label;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(20*WidthScale));
        make.height.equalTo(@(20*WidthScale));
        make.top.equalTo(self.mas_top);//.offset(-12);
        make.right.equalTo(self.mas_right);//.offset(12);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(32*WidthScale));
        make.height.equalTo(@(32*WidthScale));
        make.top.equalTo(self.mas_top).offset(6);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    self.imageView.layer.masksToBounds=YES;
    self.imageView.layer.cornerRadius=32*WidthScale/2;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.imageView.mas_bottom).offset(5);
    }];
    
}

-(void)imageDelBtnClick:(UIButton*)btn{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didImageDelBtnClicked:index:)]) {
        [self.delegate didImageDelBtnClicked:self index:(int)self.imageView.tag];
    }
}

-(void)imageClick{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didImageClicked:index:)]) {
        [self.delegate didImageClicked:self index:(int)self.imageView.tag];
    }
}

@end
