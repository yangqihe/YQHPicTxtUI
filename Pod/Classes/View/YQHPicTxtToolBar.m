//
//  YQHPicTxtToolBar.m
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtToolBar.h"
#import "YQHPicTxtDefine.h"
#import <Masonry/Masonry.h>

@interface YQHPicTxtToolBar()

@property (nonatomic, weak)  UIView* view1;

@property (nonatomic, weak)  UIView* view2;

@property (nonatomic, weak)  UIView* view3;

@property (nonatomic, weak)  UIView* view4;

@property (nonatomic, strong) NSArray* viewsArray;

//点赞
@property (weak, nonatomic) UIButton *favorBtn;

@property (weak, nonatomic) UILabel *favorCountLabel;

//评论
@property (weak, nonatomic) UIButton *commentBtn;

@property (weak, nonatomic) UILabel *commentCountLabel;

//星星
@property (weak, nonatomic) UIButton *collectBtn;

//分享
@property (weak, nonatomic) UIButton *shareBtn;


@end

@implementation YQHPicTxtToolBar

#define iconBtnWidth WidthScale*20

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //        UIView* view1=[UIView new];
        //        self.view1=view1;
        //        self.view1.tag=1;
        //        [self.view1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        //        [self addSubview:view1];
        //
        //        UIView* view2=[UIView new];
        //        self.view2=view2;
        //        self.view2.tag=2;
        //        [self.view2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        //        [self addSubview:view2];
        //
        //        UIView* view3=[UIView new];
        //        self.view3=view3;
        //        self.view3.tag=3;
        //        [self.view3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        //        [self addSubview:view3];
        //
        //        UIView* view4=[UIView new];
        //        self.view4=view4;
        //        self.view4.tag=4;
        //        [self.view4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        //        [self addSubview:view4];
        //
        //        self.viewsArray = [NSArray arrayWithObjects:self.view1,self.view2,self.view3,self.view4, nil];
        
        
        
        UIButton *favorBtn = [UIButton new];
        favorBtn.tag=1000;
        [favorBtn setBackgroundImage:[UIImage imageNamed:@"favor_btn_normal"] forState:UIControlStateNormal];
        [favorBtn setBackgroundImage:[UIImage imageNamed:@"favor_btn_selected"] forState:UIControlStateSelected];
        [favorBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.favorBtn = favorBtn;
        [self addSubview:favorBtn];
        
        UILabel *favorCount=[UILabel new];
        self.favorCountLabel=favorCount;
        //favorCount.text=@"123";
        //favorCount.backgroundColor=[UIColor grayColor];
        favorCount.textColor=[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];
        favorCount.font=[UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [self addSubview:favorCount];
        
        UIButton *commentBtn = [UIButton new];
        commentBtn.tag=1001;
        //[commentBtn setTitle:@"23" forState:UIControlStateNormal];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"common_btn"] forState:UIControlStateNormal];
        [commentBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.commentBtn = commentBtn;
        [self addSubview:commentBtn];
        
        UILabel *commentCount=[UILabel new];
        self.commentCountLabel=commentCount;
        //commentCount.text=@"123";
        //commentCount.backgroundColor=[UIColor grayColor];
        commentCount.textColor=[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];
        commentCount.font=[UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [self addSubview:commentCount];
        
        UIButton *collectBtn = [UIButton new];
        collectBtn.tag=1002;
        //[starBtn setTitle:@"23" forState:UIControlStateNormal];
        collectBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
        [collectBtn setBackgroundImage:[UIImage imageNamed:@"star_btn_normal"] forState:UIControlStateNormal];
        [collectBtn setBackgroundImage:[UIImage imageNamed:@"star_btn_selected"] forState:UIControlStateSelected];
        [collectBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.collectBtn = collectBtn;
        [self addSubview:collectBtn];
        
        
        UIButton *shareBtn = [UIButton new];
        shareBtn.tag=1003;
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"share_btn"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.shareBtn = shareBtn;
        [self addSubview:shareBtn];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat commonImageWidth=self.frame.size.width/4 ;
    
    CGFloat commonImageHeight=self.frame.size.height;
    
    CGFloat margin= 1;
    CGFloat startX = 0;
    CGFloat startY = 0;
    
    for (int i = 0; i<4; i++) {
        UIView* view=self.viewsArray[i];
        //view.backgroundColor=[UIColor orangeColor];
        int row = i/4;
        int column = i%4;
        CGFloat x = startX + column * (commonImageWidth + margin);
        CGFloat y = startY + row * (commonImageHeight + margin);
        view.frame = CGRectMake(x, y, commonImageWidth, commonImageHeight);
        [self addSubview:view];
    }
    
    
    [self.favorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.favorCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(15));
        make.width.equalTo(@(30));
        make.left.equalTo(self.favorBtn.mas_right);
        make.centerY.equalTo(self.favorBtn.mas_top);
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.left.equalTo(self.favorBtn.mas_right).offset(35);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(15));
        make.width.equalTo(@(30));
        make.left.equalTo(self.commentBtn.mas_right);
        make.centerY.equalTo(self.commentBtn.mas_top);
    }];
    
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.left.equalTo(self.commentBtn.mas_right).offset(35);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


-(void)respondsToTapSingle:(UITapGestureRecognizer *)tap{
    //DLog(@"%@",tap)
}

-(void)toolBarBtnClick:(UIButton*)btn{
    int index=0;
    switch (btn.tag) {
        case 1000:
            index=0;
            if (!self.favorBtn.selected) {
                self.favorCount++;
            }else{
                self.favorCount--;
            }
            [self setFavorCount:_favorCount];
            break;
        case 1001:
            index=1;
            break;
        case 1002:
            index=2;
            //self.collectBtn.selected=!self.collectBtn.selected;
            break;
        case 1003:
            index=3;
            break;
            
        default:
            break;
    }
    
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didToolBarBtnClicked:btn:indexPath:)]) {
        [self.delegate didToolBarBtnClicked:index btn:btn indexPath:self.indexPath];
    }
    
//    if (btn.tag==1000&&self.favorBtn.selected) {
//        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        anima.toValue = [NSNumber numberWithFloat:2.0f];
//        anima.duration = 0.1f;
//        [self.favorBtn.layer addAnimation:anima forKey:@"scaleAnimation"];
//    }
//    
//    if (btn.tag==1002&&self.collectBtn.selected) {
//        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        anima.toValue = [NSNumber numberWithFloat:2.0f];
//        anima.duration = 0.1f;
//        [self.collectBtn.layer addAnimation:anima forKey:@"scaleAnimation"];
//    }
}

- (void)setFavorCount:(int)favorCount{
    _favorCount=favorCount;
    if (favorCount) {
        _favorCountLabel.text=[NSString stringWithFormat:@"%d",favorCount];
    }else{
        _favorCountLabel.text=@"";
    }
}

- (void)setCommontCount:(int)commontCount{
    _commontCount=commontCount;
    if (commontCount) {
        _commentCountLabel.text=[NSString stringWithFormat:@"%d",commontCount];
    }else{
        _commentCountLabel.text=@"";
    }
}


- (void)setIsFavor:(BOOL)isFavor{
    _favorBtn.selected=isFavor;
}

- (void)setIsCollected:(BOOL)isCollected{
    _collectBtn.selected = isCollected;
}


@end
