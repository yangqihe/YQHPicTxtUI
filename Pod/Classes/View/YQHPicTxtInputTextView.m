//
//  YQHPicTxtInputTextView.m
//  love
//
//  Created by 杨棋贺 on 2019/5/27.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtInputTextView.h"
#import "YQHPicTxtTextView.h"
#import <Masonry/Masonry.h>

@interface YQHPicTxtInputTextView()<UITextViewDelegate>

@property (nonatomic, weak)  NSIndexPath* indexPath;

@property (nonatomic, weak)  UIButton* sendBtn;

@property (nonatomic, weak)  YQHPicTxtModel* picTxtModel;

@property (nonatomic, weak)  YQHPicTxtCommentModel* commentModel;

//@property (nonatomic, weak)  UIView* bodyView;

@property (nonatomic, assign) CGRect bodyFrame;

@end

@implementation YQHPicTxtInputTextView

+(instancetype)showWithFrame:(CGRect)frame{
    YQHPicTxtInputTextView *picTextView=[YQHPicTxtInputTextView new];
    return [picTextView initWithFrame:frame];
}

#define WidthScale      [UIScreen mainScreen].bounds.size.width / 375

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        self.bodyFrame=frame;
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        self.alpha = 0;
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        
        UIView *bodyView=[UIView new];
        bodyView.alpha=1.0;
        [self addSubview:bodyView];
        self.bodyView=bodyView;
        bodyView.backgroundColor= [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
        
        YQHPicTxtTextView *inputTextView = [YQHPicTxtTextView new];
        self.textView=inputTextView;
        self.textView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:244/255.0 green:246/255.0 blue:249/255.0 alpha:1.0];
        self.textView.layer.cornerRadius=15;
        self.textView.delegate=self;
        [bodyView addSubview:inputTextView];
        
        UIButton *btn=[UIButton new];
        //btn.backgroundColor=[UIColor colorWithRed:254/255.0 green:80/255.0 blue:2/255.0 alpha:1/1.0];
        [btn setBackgroundImage:[UIImage imageNamed:@"send_btn_normal_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"send_btn_disable_bg"] forState:UIControlStateDisabled];
        btn.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:15];
        btn.titleLabel.textColor=[UIColor whiteColor];
        self.sendBtn=btn;
        [btn setTitle:@"发送" forState:UIControlStateNormal];
        [bodyView addSubview:btn];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=5;
        [btn addTarget:self action:@selector(didSendTxt) forControlEvents:UIControlEventTouchUpInside];
        btn.enabled=NO;
    }
    return self;
}

- (void)tap {
    [self hiden];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(self.bodyFrame.size.width));
//        make.height.equalTo(@50);
//    }];
    
    self.bodyView.frame=self.bodyFrame;
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@30);
        //make.top.equalTo(self.mas_top);
        make.right.equalTo(self.bodyView.mas_right).offset(-15);
        make.centerY.equalTo(self.bodyView.mas_centerY);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bodyView.mas_left).offset(15);
        make.right.equalTo(self.sendBtn.mas_left).offset(-15);
        make.top.equalTo(self.bodyView.mas_top).offset(7.5);
        //make.bottom.equalTo(self.mas_bottom).offset(-7.5);
        make.height.equalTo(@(35*WidthScale));
    }];
}

- (void)willShow:(NSIndexPath *)indexPath picTxtModel:(YQHPicTxtModel *)picTxtModel commentModel:(YQHPicTxtCommentModel *)commentModel{
    self.indexPath=indexPath;
    self.picTxtModel=picTxtModel;
    self.commentModel=commentModel;
    [self.textView becomeFirstResponder];
    
    
    NSString *content = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([content length]) {
        self.sendBtn.enabled=YES;
    }else{
        self.sendBtn.enabled=NO;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
}

-(void)didSendTxt{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSendTxt:indexPath:picTxtModel:commentModel:)]) {
        [self.delegate didSendTxt:[self removeSpaceAndNewline:self.textView.text] indexPath:self.indexPath picTxtModel:self.picTxtModel commentModel:self.commentModel];
        
        self.textView.text=@"";
        self.textView.placeHolder=@"";
        [self hiden];
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder{
    self.textView.placeHolder=placeHolder;
}

- (void)hiden{
    [self.textView endEditing:YES];
    
    self.alpha = 0;
    __weak __typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        //[weakSelf removeFromSuperview];
        //[self removeFromSuperview];
    }];
}

- (void)textViewDidChange:(UITextView *)textView{
    NSString *content = [self removeSpaceAndNewline:self.textView.text];//[self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([content length]) {
        self.sendBtn.enabled=YES;
    }else{
        self.sendBtn.enabled=NO;
    }
}


- (NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *text = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return text;
}


@end
