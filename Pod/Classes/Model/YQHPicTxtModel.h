//
//  YQHPicTxtModel.h
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQHPicTxtModel : NSObject

@property (nonatomic, copy) NSString* ID;

//头像
@property (nonatomic, copy) NSString* avatarUrl;

//主标题
@property (nonatomic, copy) NSString* title;

//副标题
@property (nonatomic, copy) NSString* subTitle;

//时间
@property (nonatomic, copy) NSString* timeTxt;

//文章
@property (nonatomic, copy) NSString* text;

//照片
@property (nonatomic, strong) NSArray* photos;

//是否喜欢
@property (nonatomic) BOOL isLike;

//喜欢 点赞 个数
@property (nonatomic) int likeCount;

//是否收藏
@property (nonatomic) BOOL isCollected;



/** 所有评论 MHComment */
@property (nonatomic , strong) NSMutableArray *comments;

//消息个数
@property (nonatomic) int commentCount;


/**
 动态计算cell的高度  计算过的保留下来避免重新计算
 */
@property (nonatomic) CGFloat cellHeight;

/**
 评论回复的尺寸
 */
@property (nonatomic , assign ) CGRect tableViewFrame;


@end
