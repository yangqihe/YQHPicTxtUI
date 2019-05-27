//
//  YQHPicTxtCommentFrame.m
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtCommentFrame.h"
#import "YYText.h"

@interface YQHPicTxtCommentFrame()

/** 内容尺寸 */
@property (nonatomic , assign) CGRect textFrame;
/** cell高度 */
@property (nonatomic , assign) CGFloat cellHeight;

@end

@implementation YQHPicTxtCommentFrame

/**  评论水平方向间隙 */
CGFloat const MHCommentHorizontalSpace = 11.0f;
/**  评论垂直方向间隙 */
CGFloat const MHCommentVerticalSpace = 7.0f;


- (void)setComment:(YQHPicTxtCommentModel *)comment{
    _comment = comment;
    
    // 文本内容
    CGFloat textX = MHCommentHorizontalSpace;
    CGFloat textY = MHCommentVerticalSpace;
    CGSize  textLimitSize = CGSizeMake(self.maxW - 2 *textX, MAXFLOAT);
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:comment.attributedText].textBoundingSize.height;
    
    self.textFrame = (CGRect){{textX , textY} , {textLimitSize.width , textH}};
    
    self.cellHeight = CGRectGetMaxY(self.textFrame) + MHCommentVerticalSpace;
}

@end
