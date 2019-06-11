//
//  YQHPicTxtImageView1.h
//  love
//
//  Created by 杨棋贺 on 2019/5/24.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YQHPicTxtImageView1;

@protocol YQHPicTxtImageDelegate <NSObject>

@optional

-(void)didImageDelBtnClicked:(YQHPicTxtImageView1*)imageView index:(int)index;

-(void)didImageClicked:(YQHPicTxtImageView1*)imageView index:(int)index;

@end

@interface YQHPicTxtImageView1 : UIView


@property (nonatomic, weak)  UIButton* delBtn;

@property (nonatomic, weak)  UIImageView* imageView;

@property (nonatomic, weak)  UILabel* label;

@property (nonatomic, weak)  id<YQHPicTxtImageDelegate> delegate;

@property (nonatomic, assign) int index;

@end
