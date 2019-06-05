//
//  YQHPicTxtInputTextView.h
//  love
//
//  Created by 杨棋贺 on 2019/5/27.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQHPicTxtTextView.h"

@class YQHPicTxtModel;
@class YQHPicTxtCommentModel;

@protocol YQHPicTxtInputTextViewDelegate <NSObject>

@optional
-(void)didSendTxt:(NSString*)txt indexPath:(NSIndexPath*)indexPath picTxtModel:(YQHPicTxtModel*)picTxtModel commentModel:(YQHPicTxtCommentModel*)commentModel;

@end

@interface YQHPicTxtInputTextView : UIView

@property (nonatomic, weak)  YQHPicTxtTextView* textView;

@property (nonatomic, weak)  id<YQHPicTxtInputTextViewDelegate> delegate;

-(void)willShow:(NSIndexPath *)indexPath picTxtModel:(YQHPicTxtModel*)picTxtModel commentModel:(YQHPicTxtCommentModel*)commentModel;

-(void)hiden;

@property (nonatomic, strong) NSString* placeHolder;

@end

