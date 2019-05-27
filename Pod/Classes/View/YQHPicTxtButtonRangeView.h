//
//  YQHPicTxtButtonRangeView.h
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtButton.h"

@protocol YQHPicTxtButtonRangeDelegate <NSObject>

@optional

-(void)didRangeBtnClicked:(YQHPicTxtButton*)btn index:(int)index;

@end

@interface YQHPicTxtButtonRangeView : UIView

@property (nonatomic, strong) NSMutableArray* btnArray;

+ (CGFloat)heightWithArray:(NSMutableArray*)btnArray;

@property (nonatomic, weak)  id<YQHPicTxtButtonRangeDelegate> delegate;

@end

