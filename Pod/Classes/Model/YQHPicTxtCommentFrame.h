//
//  YQHPicTxtCommentFrame.h
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQHPicTxtCommentModel.h"

@interface YQHPicTxtCommentFrame : NSObject

/** 内容尺寸 */
@property (nonatomic , assign , readonly) CGRect textFrame;
/** cell高度 */
@property (nonatomic , assign , readonly) CGFloat cellHeight;

/** 最大宽度 外界传递 */
@property (nonatomic , assign) CGFloat maxW;

/** 评论模型 外界传递 */
@property (nonatomic , strong) YQHPicTxtCommentModel *comment;

@end

