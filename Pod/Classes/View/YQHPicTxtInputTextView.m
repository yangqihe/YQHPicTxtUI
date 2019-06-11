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

@end

@implementation YQHPicTxtInputTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor= [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
        
        YQHPicTxtTextView *inputTextView = [YQHPicTxtTextView new];
        self.textView=inputTextView;
        self.textView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:244/255.0 green:246/255.0 blue:249/255.0 alpha:1.0];
        self.textView.layer.cornerRadius=15;
        self.textView.delegate=self;
        [self addSubview:inputTextView];
        
        UIButton *btn=[UIButton new];
        //btn.backgroundColor=[UIColor colorWithRed:254/255.0 green:80/255.0 blue:2/255.0 alpha:1/1.0];
        [btn setBackgroundImage:[UIImage imageNamed:@"send_btn_normal_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"send_btn_disable_bg"] forState:UIControlStateDisabled];
        btn.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:15];
        btn.titleLabel.textColor=[UIColor whiteColor];
        self.sendBtn=btn;
        [btn setTitle:@"发送" forState:UIControlStateNormal];
        [self addSubview:btn];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=5;
        [btn addTarget:self action:@selector(didSendTxt) forControlEvents:UIControlEventTouchUpInside];
        btn.enabled=NO;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@30);
        //make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.sendBtn.mas_left).offset(-15);
        make.top.equalTo(self.mas_top).offset(7.5);
        make.bottom.equalTo(self.mas_bottom).offset(-7.5);
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
}

-(void)didSendTxt{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSendTxt:indexPath:picTxtModel:commentModel:)]) {
        [self.delegate didSendTxt:self.textView.text indexPath:self.indexPath picTxtModel:self.picTxtModel commentModel:self.commentModel];
        
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
}

- (void)textViewDidChange:(UITextView *)textView{
    NSString *content = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([content length]) {
        self.sendBtn.enabled=YES;
    }else{
        self.sendBtn.enabled=NO;
    }
}

@end
