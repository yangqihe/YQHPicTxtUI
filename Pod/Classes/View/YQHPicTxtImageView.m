//
//  YQHPicTxtImageView.m
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtImageView.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtImageView()

@property (nonatomic, weak)  UIButton* btn;

@property (nonatomic, weak)  UIImageView* videoTagView;

@end

@implementation YQHPicTxtImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton* btn=[UIButton new];
        btn.hidden=YES;
        self.btn=btn;
        //self.btn.backgroundColor=[UIColor redColor];
        [self.btn setBackgroundImage:[UIImage imageNamed:@"photo_del_icon"] forState:UIControlStateNormal];
        [self addSubview:btn];
        [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *videoTagView = [UIImageView new];
        [self addSubview:videoTagView];
        self.videoTagView=videoTagView;
        self.videoTagView.translatesAutoresizingMaskIntoConstraints = NO;
        self.videoTagView.backgroundColor = [UIColor clearColor];
        self.videoTagView.image=[UIImage imageNamed:@"chat_video_play"];
        self.videoTagView.hidden=YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(20*WidthScale));
        make.height.equalTo(@(20*WidthScale));
        make.top.equalTo(self.mas_top).offset(4);
        make.right.equalTo(self.mas_right).offset(-4);
    }];
    
    [self.videoTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(30*WidthScale));
        make.height.equalTo(@(30*WidthScale));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

- (void)setShowMenu:(BOOL)showMenu{
    self.btn.hidden=!showMenu;
}

- (void)setIsVideo:(BOOL)isVideo{
    if (isVideo) {
        self.videoTagView.hidden=NO;
    }else{
        self.videoTagView.hidden=YES;
    }
}

-(void)btnClick:(UIButton*)btn{
    if (self.btnClick) {
        self.btnClick();
    }
}

@end
