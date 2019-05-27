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

@interface YQHPicTxtInputTextView()

@property (nonatomic, weak)  NSIndexPath* indexPath;

@property (nonatomic, weak)  UIButton* sendBtn;

@end

@implementation YQHPicTxtInputTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        YQHPicTxtTextView *inputTextView = [YQHPicTxtTextView new];
        inputTextView.backgroundColor=[UIColor grayColor];
        self.textView=inputTextView;
        [self addSubview:inputTextView];
        
        UIButton *btn=[UIButton new];
        btn.backgroundColor=[UIColor redColor];
        self.sendBtn=btn;
        [self addSubview:btn];
        [btn addTarget:self action:@selector(didSendTxt) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@50);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.equalTo(self.mas_height);
        //make.width.equalTo(@(SCREEN_WIDTH-50));
    }];
}

- (void)willShow:(NSIndexPath *)indexPath{
    self.indexPath=indexPath;
    [self.textView becomeFirstResponder];
}

-(void)didSendTxt{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSendTxt:indexPath:)]) {
        [self.delegate didSendTxt:self.textView.text indexPath:self.indexPath];
    }
}

@end
