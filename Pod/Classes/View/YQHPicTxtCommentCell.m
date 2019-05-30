//
//  YQHPicTxtCommentCell.m
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtCommentCell.h"
#import <Masonry/Masonry.h>
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtCommentCell()

/** 文本内容 */
@property (nonatomic , weak) UILabel *contentLabel;

@end

@implementation YQHPicTxtCommentCell

#define commentTxtLineSpace 1.0f
#define commentTxtLineWidth (SCREEN_WIDTH-(marginLeft+marginRight))

#define nameColor  [UIColor colorWithRed:222/255.0 green:102/255.0 blue:48/255.0 alpha:1/1.0]

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


-(void)selectCell:(UITapGestureRecognizer *)tapRecognizer{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSelectModel:)]) {
        [self.delegate didSelectModel:_model];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self initLayout];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectCell:)]];
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
    contentLabel.userInteractionEnabled=YES;
    //[contentLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapComment)]];
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
}

-(NSMutableAttributedString *)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
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
    //NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:label.text attributes:dic];
    NSMutableAttributedString *attributeStr=[[NSMutableAttributedString alloc] initWithString:label.text attributes:dic];
    label.attributedText = attributeStr;
    return attributeStr;
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
    _model=model;
    NSString *text = [YQHPicTxtCommentCell getContext:model];
    self.contentLabel.text=text;
    NSMutableAttributedString *attributeStr=[self setLabelSpace:self.contentLabel withValue:text withFont:commentTxtFont];
    
    NSMutableAttributedString *attributeStr1=[self adjustTextColor:text rangeText1:model.fromUserName rangeText2:model.toUserName color: nameColor attribute:attributeStr];
    
    self.contentLabel.attributedText=attributeStr1;
}

+(NSString*)getContext:(YQHPicTxtCommentModel *)model{
    NSString *text;
    if ([model.toUserName length]) {
        text=[NSString stringWithFormat:@"%@ 回复 %@:%@",model.fromUserName,model.toUserName,model.text];
    }else{
        text=[NSString stringWithFormat:@"%@:%@",model.fromUserName,model.text];
    }

    return text;
}

- (NSMutableAttributedString *)adjustTextColor:(NSString *)text rangeText1:(NSString *)rangeText1 rangeText2:(NSString *)rangeText2 color:(UIColor *)color attribute:(NSMutableAttributedString*)attribute{
    if ([rangeText1 length]) {
        NSRange range1 = [text rangeOfString:rangeText1];
        [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range1];
    }
    
    if (rangeText2) {
        NSUInteger index=rangeText1.length;
        NSString *text_=[text substringFromIndex:index];
        NSRange range2 = [text_ rangeOfString:rangeText2];
        NSRange range3=NSMakeRange(index+4, rangeText2.length);
        [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range3];
    }
    

    
    return attribute;
}


+ (CGFloat)cellHeightWithModel:(YQHPicTxtCommentModel *)model{
    NSString *text = [YQHPicTxtCommentCell getContext:model];
    CGFloat strHeight=[YQHPicTxtCommentCell getSpaceLabelHeight:text withFont:commentTxtFont withWidth:commentTxtLineWidth];
    return strHeight;
}


@end
