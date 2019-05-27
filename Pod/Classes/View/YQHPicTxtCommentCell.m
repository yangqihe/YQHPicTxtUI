//
//  YQHPicTxtCommentCell.m
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtCommentCell.h"
#import "YYLabel.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtCommentCell()

/** 文本内容 */
@property (nonatomic , weak) UILabel *contentLabel;

@end

@implementation YQHPicTxtCommentCell

#define commentTxtLineSpace 1.0f
#define commentTxtLineWidth (SCREEN_WIDTH-(marginLeft+marginRight))

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"YQHPicTxtCommentCell";
    YQHPicTxtCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor=[UIColor clearColor];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self initLayout];
    }
    
    return self;
}

- (void)initLayout
{
    UILabel *contentLabel = [UILabel new];
    contentLabel.numberOfLines = 0 ;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.font=commentTxtFont;
    contentLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH-marginLeft-marginRight));
    }];
    
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = commentTxtLineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:label.text attributes:dic];
    label.attributedText = attributeStr;
}


//计算UILabel的高度(带有行间距的情况)
+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = commentTxtLineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    CGSize size = [str boundingRectWithSize:CGSizeMake(commentTxtLineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

- (void)setModel:(YQHPicTxtCommentModel *)model{
    self.contentLabel.text=model.text;
    [self setLabelSpace:self.contentLabel withValue:model.text withFont:commentTxtFont];
}


+ (CGFloat)cellHeightWithModel:(YQHPicTxtCommentModel *)model{
    CGFloat strHeight=[YQHPicTxtCommentCell getSpaceLabelHeight:model.text withFont:commentTxtFont withWidth:commentTxtLineWidth];
    return strHeight;
}


@end
