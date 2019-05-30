//
//  YQHPicTxtCommentModel.h
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class MHUser;

@interface YQHPicTxtCommentModel : NSObject

/** 视频的id */
@property (nonatomic , copy) NSString *mediabase_id;

/** 评论、回复id */
@property (nonatomic , copy) NSString * commentId;

/** 创建时间 */
@property (nonatomic , copy) NSString *creatTime;

/** 回复用户模型 */
@property (nonatomic , copy) NSString *toUserName;

/** 来源用户模型 */
@property (nonatomic , copy) NSString *fromUserName;

/** 话题内容 */
@property (nonatomic, copy) NSString *text;


/** 获取富文本 */
- (NSAttributedString *)attributedText;

@end

