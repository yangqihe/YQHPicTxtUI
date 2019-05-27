//
//  YQHPicTxtButton.m
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtButton.h"

@implementation YQHPicTxtButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:@"class_bg_normal"] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"class_bg_selected"] forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Medium" size:15];
        [self setTitleColor: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        [self setTitleColor: [UIColor whiteColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
