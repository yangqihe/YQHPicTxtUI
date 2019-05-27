//
//  YQHPicTxtTextView.h
//  Masonry
//
//  Created by 杨棋贺 on 2019/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQHPicTxtTextView : UITextView

@property (nonatomic, copy) NSString *placeHolder;

@property (nonatomic, strong) UIColor *placeHolderTextColor;

- (NSUInteger)numberOfLinesOfText;

+ (NSUInteger)maxCharactersPerLine;

+ (NSUInteger)numberOfLinesForMessage:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
