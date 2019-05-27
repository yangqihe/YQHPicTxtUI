//
//  YQHPicTxtCommentModel.m
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtCommentModel.h"
#import "YYText.h"

@implementation YQHPicTxtCommentModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (NSAttributedString *)attributedText
{
//    if (!MHObjectIsNil(self.toUser) && self.toUser.nickname.length>0) {
//        // 有回复
//        NSString *textString = [NSString stringWithFormat:@"%@回复%@: %@", self.fromUser.nickname, self.toUser.nickname, self.text];;
//        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
//        mutableAttributedString.yy_font = MHCommentTextFont;
//        mutableAttributedString.yy_color = MHGlobalBlackTextColor;
//        mutableAttributedString.yy_lineSpacing = MHCommentContentLineSpacing;
//
//        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length);
//        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
//        fromUserHighlight.userInfo = @{MHCommentUserKey:self.fromUser};
//        [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
//        // 设置昵称颜色
//        [mutableAttributedString yy_setColor:MHGlobalOrangeTextColor range:NSMakeRange(0, self.fromUser.nickname.length)];
//
//
//
//        NSRange toUserRange = [textString rangeOfString:[NSString stringWithFormat:@"%@:",self.toUser.nickname]];
//        // 文本高亮模型
//        YYTextHighlight *toUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
//        // 这里痛过属性的userInfo保存User模型，后期通过获取模型然后获取User模型
//        toUserHighlight.userInfo = @{MHCommentUserKey:self.toUser};
//
//        [mutableAttributedString yy_setTextHighlight:toUserHighlight range:toUserRange];
//        [mutableAttributedString yy_setColor:MHGlobalOrangeTextColor range:toUserRange];
//
//        return mutableAttributedString;
//
//
//    }else{
//
//        // 没有回复
//        NSString *textString = [NSString stringWithFormat:@"%@: %@", self.fromUser.nickname, self.text];
//        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
//        mutableAttributedString.yy_font = MHCommentTextFont;
//        mutableAttributedString.yy_color = MHGlobalBlackTextColor;
//        mutableAttributedString.yy_lineSpacing = MHCommentContentLineSpacing;
//
//        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length+1);
//        // 设置昵称颜色
//        [mutableAttributedString yy_setColor:MHGlobalOrangeTextColor range:fromUserRange];
//
//        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
//        fromUserHighlight.userInfo = @{MHCommentUserKey:self.fromUser};
//        [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
//
//
//
//        return mutableAttributedString;
//    }
    
    return nil;
}

@end
