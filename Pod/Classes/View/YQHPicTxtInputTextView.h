//
//  YQHPicTxtInputTextView.h
//  love
//
//  Created by 杨棋贺 on 2019/5/27.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtTextView.h"

@protocol YQHPicTxtInputTextViewDelegate <NSObject>

@optional
-(void)didSendTxt:(NSString*)txt indexPath:(NSIndexPath*)indexPath;

@end

@interface YQHPicTxtInputTextView : UIView

@property (nonatomic, weak)  YQHPicTxtTextView* textView;

@property (nonatomic, weak)  id<YQHPicTxtInputTextViewDelegate> delegate;

-(void)willShow:(NSIndexPath *)indexPath;

@end

