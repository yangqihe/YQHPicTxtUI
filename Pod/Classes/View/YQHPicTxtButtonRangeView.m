//
//  YQHPicTxtButtonRangeView.m
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtButtonRangeView.h"
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtButtonRangeView()

@end

@implementation YQHPicTxtButtonRangeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setBtnArray:(NSMutableArray *)btnArray{
    //模拟加载数据
    CGFloat startX = 0;
    CGFloat startY = 0;
    
    CGFloat ImageMagin = 8;
    
    CGFloat btnWidth =(SCREEN_WIDTH-(marginLeft+marginRight+ImageMagin*2))/3;
    
    CGFloat btnHeight=32*WidthScale;
    for (int i = 0; i<btnArray.count; i++) {
        YQHPicTxtButton* btn=btnArray[i];
        [self addSubview:btn];
        int row = i/3;
        int column = i%3;
        CGFloat x = startX + column * (btnWidth + ImageMagin);
        CGFloat y = startY + row * (btnHeight + ImageMagin);
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
        btn.tag=i;
        [btn addTarget:self action:@selector(classBtnClick:) forControlEvents:UIControlEventTouchDown];
    }
}

-(void)classBtnClick:(YQHPicTxtButton*)btn{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didRangeBtnClicked:index:)]) {
        [self.delegate didRangeBtnClicked:btn index:(int)btn.tag];
    }
}

+ (CGFloat)heightWithArray:(NSMutableArray*)btnArray{
    int row = ((int)btnArray.count)/4;
    
    CGFloat btnHeight=32*WidthScale;
    CGFloat ImageMagin = 8;
    
    return (row+1)*btnHeight+ImageMagin*row;
}

@end
