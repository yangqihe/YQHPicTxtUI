//
//  YQHPicTxtToolBar1.m
//  AFNetworking
//
//  Created by 杨棋贺 on 2019/6/6.
//

#import "YQHPicTxtToolBar1.h"
//#import "YQHPicTxtDefine.h"
#import <Masonry/Masonry.h>

@interface YQHPicTxtToolBar1()

@property (nonatomic, weak)  UIView* view1;

@property (nonatomic, weak)  UIView* view2;

@property (nonatomic, weak)  UIView* view3;

@property (nonatomic, weak)  UIView* view4;

//@property (nonatomic, strong) NSArray* viewsArray;

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


@implementation YQHPicTxtToolBar1

#define WidthScale [UIScreen mainScreen].bounds.size.width / 375

#define  toolBarViewWidth  self.frame.size.width/4  //-marginLeft-marginRight

#define iconBtnWidth WidthScale*20

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView* view1=[UIView new];
        self.view1=view1;
        self.view1.tag=0;
        [self.view1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        [self addSubview:view1];
        
        UIView* view2=[UIView new];
        self.view2=view2;
        self.view2.tag=1;
        [self.view2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        [self addSubview:view2];
        
        UIView* view3=[UIView new];
        self.view3=view3;
        self.view3.tag=2;
        [self.view3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        [self addSubview:view3];
        
        UIView* view4=[UIView new];
        self.view4=view4;
        self.view4.tag=3;
        [self.view4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)]];
        [self addSubview:view4];
        
        //self.viewsArray = [NSArray arrayWithObjects:self.view1,self.view2,self.view3,self.view4, nil];
        
        
        
        UIButton *collectBtn = [UIButton new];
        collectBtn.tag=0;
        //[starBtn setTitle:@"23" forState:UIControlStateNormal];
        collectBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
        [collectBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_collect_normal"] forState:UIControlStateNormal];
        [collectBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_collect_selected"] forState:UIControlStateSelected];
        [collectBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.collectBtn = collectBtn;
        [view1 addSubview:collectBtn];
        
        
        //view2.backgroundColor=[UIColor grayColor];
        UIButton *favorBtn = [UIButton new];
        self.favorBtn = favorBtn;
        favorBtn.tag=1;
        [favorBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_favor_normal"] forState:UIControlStateNormal];
        [favorBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_favor_selected"] forState:UIControlStateSelected];
        [favorBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view2 addSubview:favorBtn];
        
        UILabel *favorCount=[UILabel new];
        self.favorCountLabel=favorCount;
        //favorCount.text=@"123";
        //favorCount.backgroundColor=[UIColor grayColor];
        favorCount.textColor=[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];
        favorCount.font=[UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [view2 addSubview:favorCount];
        
        
        //view3.backgroundColor=[UIColor redColor];
        UIButton *commentBtn = [UIButton new];
        commentBtn.tag=2;
        //[commentBtn setTitle:@"23" forState:UIControlStateNormal];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_comment_normal"] forState:UIControlStateNormal];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_comment_selected"] forState:UIControlStateSelected];
        [commentBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.commentBtn = commentBtn;
        [view3 addSubview:commentBtn];
        
        UILabel *commentCount=[UILabel new];
        self.commentCountLabel=commentCount;
        //commentCount.text=@"123";
        //commentCount.backgroundColor=[UIColor grayColor];
        commentCount.textColor=[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];
        commentCount.font=[UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [view3 addSubview:commentCount];
        
        
        UIButton *shareBtn = [UIButton new];
        shareBtn.tag=3;
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"pic_txt_share"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(toolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.shareBtn = shareBtn;
        [view4 addSubview:shareBtn];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@(toolBarViewWidth));
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.centerX.equalTo(self.view1.mas_centerX);
        make.centerY.equalTo(self.view1.mas_centerY);
    }];
    
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@(toolBarViewWidth));
        make.left.equalTo(self.view1.mas_right);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.favorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.centerX.equalTo(self.view2.mas_centerX);
        make.centerY.equalTo(self.view2.mas_centerY);
    }];
    
    [self.favorCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(15));
        make.width.equalTo(@(30));
        make.left.equalTo(self.favorBtn.mas_right);
        make.centerY.equalTo(self.favorBtn.mas_top);
    }];
    

    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@(toolBarViewWidth));
        make.left.equalTo(self.view2.mas_right);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.centerX.equalTo(self.view3.mas_centerX);
        make.centerY.equalTo(self.view3.mas_centerY);
    }];
    
    [self.commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(15));
        make.width.equalTo(@(30));
        make.left.equalTo(self.commentBtn.mas_right);
        make.centerY.equalTo(self.commentBtn.mas_top);
    }];
    
    
    [self.view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@(toolBarViewWidth));
        make.left.equalTo(self.view3.mas_right);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(iconBtnWidth));
        make.width.equalTo(@(iconBtnWidth));
        make.centerX.equalTo(self.view4.mas_centerX);
        make.centerY.equalTo(self.view4.mas_centerY);
    }];
}


-(void)respondsToTapSingle:(UITapGestureRecognizer *)tap{
    NSLog(@"%@",tap);
    int index=tap.view.tag;
    UIButton *btn=nil;
    switch (index) {
        case 0:
            btn=self.collectBtn;
            break;
        case 1:
            btn=self.favorBtn;
            if (!self.favorBtn.selected) {
                self.favorCount++;
            }else{
                self.favorCount--;
            }
            [self setFavorCount:_favorCount];
            break;
        case 2:
            btn=self.commentBtn;
            break;
        case 3:
            btn=self.shareBtn;
            break;
            
        default:
            break;
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didToolBarBtnClicked:btn:indexPath:)]) {
        [self.delegate didToolBarBtnClicked:index btn:btn indexPath:self.indexPath];
    }
    
}

-(void)toolBarBtnClick:(UIButton*)btn{
    int index=btn.tag;
    switch (index) {
        case 0:
            btn=self.collectBtn;
            break;
        case 1:
            btn=self.favorBtn;
            if (!self.favorBtn.selected) {
                self.favorCount++;
            }else{
                self.favorCount--;
            }
            [self setFavorCount:_favorCount];
            break;
        case 2:
            btn=self.commentBtn;
            break;
        case 3:
            btn=self.shareBtn;
            break;
            
        default:
            break;
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didToolBarBtnClicked:btn:indexPath:)]) {
        [self.delegate didToolBarBtnClicked:index btn:btn indexPath:self.indexPath];
    }
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
        self.commentBtn.selected=YES;
    }else{
        self.commentBtn.selected=NO;
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
