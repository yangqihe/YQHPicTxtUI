//
//  YQHPicTxtCell.m
//  love
//
//  Created by 杨棋贺 on 2019/5/23.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import "YQHPicTxtCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "YQHPicTxtDefine.h"
#import "YQHPicTxtCommentFrame.h"
#import "YQHPicTxtCommentCell.h"
#import "YQHPicTxtImageView.h"
#import "YQHPicTxtDefine.h"

@interface YQHPicTxtCell()<UITableViewDelegate , UITableViewDataSource,YQHPicTxtCommentCellDelegate>

//头像
@property (nonatomic, strong) UIImageView* avatarView;

//标题
@property (nonatomic, strong) UILabel *titleLabel;

//副标题
@property (nonatomic, strong) UILabel *subTitleLabel;

//详情
@property (nonatomic, strong) UILabel *detailLabel;

//类型标签
@property (nonatomic, strong) UILabel *detailTypeMarkLabel;

//时间
@property (nonatomic, strong) UILabel *timeLabel;


@property (nonatomic, strong) UIView* photosView;


@property (nonatomic, strong) NSMutableArray* imageViewArray;


@property (nonatomic, strong) UITableView* commentTableView;

//记录当前cell的下标
@property (nonatomic, strong) NSIndexPath* indexPath;

@property (nonatomic, strong) UIView* footerView;
@end


@implementation YQHPicTxtCell

#define avatarTxtMargin  12.0f //;//头像 文字 间隙
#define txtImgMargin  6.0f //;//文字 照片 间隙
#define detailTypeMarkHeight  30.0f //;//类型标签高度
#define imgBottomMargin  6.0f //;//照片 底部工具栏 间隙


#define avatarMarginTop 15.0f //;
#define avatarWidth  45.0f //;
#define toolBarHeight  35.0f //;

#define commentHeaderHeight  30.0f //;//评论header高度
#define commentFooterHeight  5.0f //;//评论footer高度

#define footerViewHeight 10.0f

#define image_loading1 [UIImage imageNamed:@"pic_txt_image_bg"]
//#define image_loading2 [UIImage imageNamed:@"image_loading2"]
//#define image_loading3 [UIImage imageNamed:@"image_loading3"]

#define titleTxtFont [UIFont boldSystemFontOfSize:15*WidthScale]

#define detailTxtFont [UIFont fontWithName:@"PingFangSC-Regular" size:13*WidthScale]
#define detailTxtLineSpace 2.0f
#define detailTxtLineWidth (SCREEN_WIDTH-(marginLeft+marginRight))

#define commonImageMagin 4

#define commonImageWidth (SCREEN_WIDTH - marginLeft - marginRight - commonImageMagin*2)/3

#define PicTxtImageWidth commonImageWidth*2
#define PicTxtImageHeight commonImageWidth*1.6

#define PicTxtImageMaxWidth    SCREEN_WIDTH - marginLeft-marginRight
#define PicTxtImageMinWidth    commonImageWidth*2

#define PicTxtImageMaxHeight    SCREEN_WIDTH * 0.85 //commonImageWidth*3
#define PicTxtImageMinHeight    commonImageWidth

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"YQHPicTxtCell";
    YQHPicTxtCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}


- (void)initLayout
{
    // 头像
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(marginLeft, avatarMarginTop, avatarWidth, avatarWidth)];//图片的大小 66,66 50 ，50
    //self.avatarView.backgroundColor = [UIColor orangeColor];
    self.avatarView.layer.masksToBounds = YES;
    self.avatarView.layer.cornerRadius = avatarWidth/2;
    [self.contentView addSubview:self.avatarView];
    
    //标题
    self.titleLabel = [UILabel new];
    //self.titleLabel.backgroundColor = [UIColor grayColor];
    //self.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:15*WidthScale];
    self.titleLabel.font = titleTxtFont;//[UIFont boldSystemFontOfSize:15*WidthScale];
    //self.titleLabel.text = @"";
    self.titleLabel.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];
    [self.titleLabel sizeToFit];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(22);
        make.height.equalTo(self.titleLabel.mas_height);
        make.width.equalTo(self.titleLabel.mas_width);
    }];
    
    //副标题
    self.subTitleLabel = [UILabel new];
    //self.subTitleLabel.backgroundColor = [UIColor greenColor];
    self.subTitleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:12];
    //self.subTitleLabel.text = @"";
    self.subTitleLabel.textColor = [UIColor colorWithRed:18/255.0f green:159/255.0f blue:255/255.0f alpha:1.0];
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(22);
        make.height.equalTo(self.subTitleLabel.mas_height);
        make.width.equalTo(self.subTitleLabel.mas_width);
    }];
    
    //时间
    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.timeLabel.text = @".";
    self.timeLabel.textAlignment=NSTextAlignmentLeft;
    self.timeLabel.textColor = [UIColor colorWithRed:187/255.0f green:187/255.0f blue:187/255.0f alpha:1.0];
    //self.timeLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(4);
        make.height.equalTo(self.timeLabel.mas_height);
        make.width.equalTo(self.timeLabel.mas_width);
    }];
    
    // 详情
    self.detailLabel = [UILabel new];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textColor=[UIColor colorWithRed:56/255.0f green:65/255.0f blue:83/255.0f alpha:1.0];
    
    [self.contentView addSubview:self.detailLabel];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-marginLeft);
        make.top.equalTo(self.avatarView.mas_bottom).offset(avatarTxtMargin);
    }];
    
    //图片
    self.photosView=[UIView new];
    [self.contentView addSubview:self.photosView];
    //self.photosView.backgroundColor=[UIColor greenColor];
    
    self.imageViewArray=[NSMutableArray array];
    
    for (int i=0; i<9; i++) {
        YQHPicTxtImageView *imageView=[YQHPicTxtImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.imageViewArray addObject:imageView];
        [self.photosView addSubview:imageView];
        imageView.userInteractionEnabled=YES;
        imageView.tag=i;
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius=4;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)]];
    }
    
    [self.photosView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(txtImgMargin);
        make.width.equalTo(@(SCREEN_WIDTH-marginLeft-marginRight));
    }];
    
    
    self.detailTypeMarkLabel=[UILabel new];
    //self.detailTypeMarkLabel.text=@"活动详情";
    //self.detailTypeMarkLabel.backgroundColor=[UIColor grayColor];
    self.detailTypeMarkLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.detailTypeMarkLabel.textColor = [UIColor colorWithRed:50/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];

    [self.contentView addSubview:self.detailTypeMarkLabel];
    [self.detailTypeMarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left);
        make.top.equalTo(self.photosView.mas_bottom);
        make.width.equalTo(@(SCREEN_WIDTH-marginLeft-marginRight));
        make.height.equalTo(@(detailTypeMarkHeight));
    }];
    
    self.bottomToolBar=[YQHPicTxtToolBar new];
    [self.contentView addSubview:self.bottomToolBar];
    //self.bottomToolBar.backgroundColor=[UIColor grayColor];
    [self.bottomToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left);
        make.top.equalTo(self.detailTypeMarkLabel.mas_bottom).offset(imgBottomMargin);
        make.height.equalTo(@(toolBarHeight));
        make.width.equalTo(@(SCREEN_WIDTH-marginLeft-marginRight));
    }];
    
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.scrollEnabled = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:tableView];
    //tableView.backgroundColor=[UIColor colorWithRed:246/255.0f green:247/255.0f blue:248/255.0f alpha:1.0];
    tableView.backgroundColor=[UIColor clearColor];
    self.commentTableView = tableView;
    tableView.userInteractionEnabled=YES;
    //tableView.isFirstResponder=YES;
    //self.commentTableView.backgroundColor=[UIColor redColor];
    
    [self.commentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left);
        make.top.equalTo(self.bottomToolBar.mas_bottom).offset(0);
        make.width.equalTo(@(SCREEN_WIDTH-marginLeft-marginRight));
    }];
    
    _footerView=[UIView new];
    _footerView.backgroundColor=[UIColor colorWithRed:246/255.0f green:247/255.0f blue:248/255.0f alpha:1.0];//[UIColor clearColor];
    [self.contentView addSubview:_footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(footerViewHeight));
        make.width.equalTo(@(SCREEN_WIDTH));
        make.top.equalTo(self.commentTableView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
    }];
}


-(void)didSelectModel:(YQHPicTxtCommentModel *)picTxtCommentModel{
    if (self.commentDelegate&&[self.commentDelegate respondsToSelector:@selector(didSelect:picTxtModel:commentModel:)]) {
        [self.commentDelegate didSelect:self.indexPath picTxtModel:self.model commentModel:picTxtCommentModel];
    }
}

#pragma mark - UITableViewDelegate , UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.comments.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YQHPicTxtCommentCell *cell = [YQHPicTxtCommentCell cellWithTableView:tableView];
    YQHPicTxtCommentModel *model=self.model.comments[indexPath.row];
    cell.model=model;
    cell.delegate=self;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YQHPicTxtCommentModel *model=self.model.comments[indexPath.row];
    return [YQHPicTxtCommentCell cellHeightWithModel:model];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    //YQHPicTxtCommentModel *model=self.model.comments[indexPath.row];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.model.comments.count) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, commentHeaderHeight)];
        //view.backgroundColor=[UIColor whiteColor];
        UILabel *label = [[UILabel alloc] init];
        [view addSubview:label];
        label.text = @"评论";
        label.font = titleTxtFont;
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        //label.frame=CGRectMake(0, 0, SCREEN_WIDTH, 20);
        [label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.mas_centerY);
            make.left.equalTo(view.mas_left).offset(0);
        }];
        
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.model.comments.count) {
        return commentHeaderHeight;
    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (self.model.comments.count) {
//        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, commentFooterHeight)];
//        return view;
//    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.model.comments.count) {
        return commentFooterHeight;
    }
    return 0.1;
}

- (void)tapImage:(UITapGestureRecognizer *)tap
{
    if (_imageDelegate&&[_imageDelegate respondsToSelector:@selector(imageClicked:model:view:)]) {
        [_imageDelegate imageClicked:(int)tap.view.tag model:self.model view:tap.view];
    }
}


- (void)setModel:(YQHPicTxtModel *)model{
    
    _model=model;
    
    NSURL* avatarUrl = [NSURL URLWithString:model.avatarUrl];
    
    [self.avatarView sd_setImageWithURL:avatarUrl placeholderImage:[UIImage imageNamed:@"image_loading1"] options:SDWebImageRefreshCached];
    
    self.titleLabel.text=model.title;
    
    if (model.subTitle) {
        self.subTitleLabel.text=[NSString stringWithFormat:@"#%@#",model.subTitle];
    }
    
    self.timeLabel.text=model.timeTxt;
    
    self.detailLabel.text=model.text;
    
    [self setLabelSpace:self.detailLabel withValue:self.detailLabel.text withFont:detailTxtFont];
    
    CGFloat photosHeight=0;
    if (model.photos.count==1) {
        photosHeight+=[YQHPicTxtCell calImageSize:model];//model.actualHeight;//[YQHPicTxtCell imageWidth:model.fileWidth imgHeight:model.fileHeight];//commonImageWidth*1.5;//自适应
    }else if (1<model.photos.count&&model.photos.count<=3){
        photosHeight+=commonImageWidth;
    }else if(3<model.photos.count&&model.photos.count<=6){
        photosHeight+=commonImageWidth*2+commonImageMagin;
    }else if((6<model.photos.count&&model.photos.count<=9)){
        photosHeight+=commonImageWidth*3+commonImageMagin*2;
    }
    
    if (model.photos.count) {
        [self.photosView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(photosHeight));
            make.top.equalTo(self.detailLabel.mas_bottom).offset(txtImgMargin);
        }];
        
        [self.bottomToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailTypeMarkLabel.mas_bottom).offset(imgBottomMargin);
        }];
    }else{
        [self.photosView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(photosHeight));
            make.top.equalTo(self.detailLabel.mas_bottom).offset(0);
        }];
        
        [self.bottomToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailTypeMarkLabel.mas_bottom).offset(0);
        }];
    }

    
    [self calculatePhotosPosition:model];
    
    if ([model.typeMarkTxt length]) {
        self.detailTypeMarkLabel.hidden=NO;
        self.detailTypeMarkLabel.text=model.typeMarkTxt;
        [self.detailTypeMarkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(detailTypeMarkHeight));
        }];
    }else{
        self.detailTypeMarkLabel.hidden=YES;
        [self.detailTypeMarkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
    }
    
    self.bottomToolBar.commontCount=model.commentCount;
    self.bottomToolBar.favorCount=model.favorCount;
    self.bottomToolBar.isFavor=model.isFavor;
    self.bottomToolBar.isCollected=model.isCollected;
    
    [YQHPicTxtCell calculateComment:model];

    [self.commentTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(model.tableViewFrame.size.height));
    }];
    
    [self.commentTableView reloadData];
}

-(void)calculatePhotosPosition:(YQHPicTxtModel *)model{
    
    for (int i = 0; i < 9; i++) {
        YQHPicTxtImageView* imageView=self.imageViewArray[i];
        imageView.hidden=YES;
        imageView.isVideo=NO;
    }
    
    if (model.photos.count==1) {
        
        YQHPicTxtImageView* imageView=self.imageViewArray[0];
        
        
        //CGSize imageViewSize=imageView.frame.size;
        
        if (model.isVideo) {
            
            imageView.isVideo=YES;
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.videoThumbURL] placeholderImage:image_loading1 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                
            }];
            
        }else{
            
            imageView.isVideo=NO;
            
            if ([model.photos[0] hasPrefix:@"http"]){
                [imageView sd_setImageWithURL:[NSURL URLWithString:model.photos[0]] placeholderImage:image_loading1 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    
                }];
            }else{
                
                UIImage *image=[UIImage imageNamed:model.photos[0]];
                
                imageView.image=image;
                
            }
        }

        imageView.hidden=NO;
        imageView.frame=CGRectMake(0, 0, model.actualWidth, model.actualHeight);
        imageView.backgroundColor=[UIColor colorWithRed:246/255.0f green:247/255.0f blue:248/255.0f alpha:1.0];//[UIColor grayColor];
        
    }else if (model.photos.count==4){
        
        CGFloat startX = 0;
        CGFloat startY = 0;
        
        int count=(int)model.photos.count;
        if (count>9) {
            count=9;
        }
        
        for (int i = 0; i<count; i++) {
            UIImageView* imageView=self.imageViewArray[i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.photos[i]] placeholderImage:image_loading1 options:SDWebImageRefreshCached];
            imageView.hidden=NO;
            imageView.backgroundColor=[UIColor colorWithRed:246/255.0f green:247/255.0f blue:248/255.0f alpha:1.0];//[UIColor grayColor];
            int row = i/2;
            int column = i%2;
            CGFloat x = startX + column * (commonImageWidth + commonImageMagin);
            CGFloat y = startY + row * (commonImageWidth + commonImageMagin);
            imageView.frame = CGRectMake(x, y, commonImageWidth, commonImageWidth);
        }
        
    }else{
        
        CGFloat startX = 0;
        CGFloat startY = 0;
        
        int count=(int)model.photos.count;
        if (count>9) {
            count=9;
        }
        
        for (int i = 0; i<count; i++) {
            UIImageView* imageView=self.imageViewArray[i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.photos[i]] placeholderImage:image_loading1 options:SDWebImageRefreshCached];
            imageView.hidden=NO;
            imageView.backgroundColor=[UIColor colorWithRed:246/255.0f green:247/255.0f blue:248/255.0f alpha:1.0];//[UIColor grayColor];
            int row = i/3;
            int column = i%3;
            CGFloat x = startX + column * (commonImageWidth + commonImageMagin);
            CGFloat y = startY + row * (commonImageWidth + commonImageMagin);
            imageView.frame = CGRectMake(x, y, commonImageWidth, commonImageWidth);
        }
    }
}


+ (CGFloat)cellHeightWithModel:(YQHPicTxtModel *)model{
    
    if (model.cellHeight) {
        return model.cellHeight;
    }
    
    if (model) {
        
        CGFloat height=0;
        
        height+=avatarMarginTop;//头像 顶部 缝隙
        
        height+=avatarWidth;//头像 高度
        
        if ([model.text length]) {
            height+=avatarTxtMargin;//头像 文字 间隙
        }
        
        CGFloat strHeight=[YQHPicTxtCell getSpaceLabelHeight:model.text withFont:detailTxtFont withWidth:detailTxtLineWidth];
        
        height+=strHeight;
        
        if (model.photos.count) {
            height+=txtImgMargin;//文字 照片 间隙
        }
        
        if (model.photos.count==1) {
            height+=[YQHPicTxtCell calImageSize:model];//model.actualHeight;//[YQHPicTxtCell imageWidth:model.fileWidth imgHeight:model.fileHeight];
        }else if (1<model.photos.count&&model.photos.count<=3){
            height+=commonImageWidth;
        }else if(3<model.photos.count&&model.photos.count<=6){
            height+=commonImageWidth*2+commonImageMagin;
        }else if((6<model.photos.count&&model.photos.count<=9)){
            height+=commonImageWidth*3+commonImageMagin*2;
        }
        
        if ([model.typeMarkTxt length]) {
            height+=detailTypeMarkHeight;//标签高度
        }
        
        if (model.photos.count) {
            height+=imgBottomMargin;//照片底部工具栏间隙
        }
        
        height+=toolBarHeight;//底部栏高度
        
        model.cellHeight=height;
        
        model.cellHeight+=[self calculateComment:model];
        
        model.cellHeight+=footerViewHeight;
        
        return model.cellHeight;
    }
    
    return 0;
}

+ (CGFloat)calImageSize:(YQHPicTxtModel *)model{
    
    if (model.actualWidth&&model.actualHeight) {
        return model.actualHeight;
    }
    
    CGFloat imgWidth=model.fileWidth;
    CGFloat imgHeight=model.fileHeight;
    
    CGFloat actualWidth=0;
    CGFloat actualHeight=0;
    
    
    
    if (model.rankType==YQHPicTxtImageType) {
        
        if (imgWidth == 0 || imgHeight == 0||imgWidth==imgHeight){
            
            actualWidth = PicTxtImageWidth;
            actualHeight = PicTxtImageHeight;
            
        }else{
            
            actualWidth = PicTxtImageWidth;
            
            actualHeight = imgHeight * actualWidth/imgWidth;
            
            if (actualHeight<PicTxtImageMinHeight) {
                actualHeight = PicTxtImageMinHeight;
            }
            
            if (actualHeight>PicTxtImageMaxHeight) {
                actualHeight = PicTxtImageMaxHeight;
            }
            
        }

    }else if (model.rankType==YQHPicTxtVideoType){
        
        if(imgWidth>imgHeight){
            
            actualWidth = PicTxtImageMaxWidth;
            
            actualHeight = PicTxtImageHeight;
            
        }else{
            
            actualWidth = PicTxtImageWidth;
            
            actualHeight = imgHeight * actualWidth/imgWidth;
            
            if (actualHeight<PicTxtImageMinHeight) {
                actualHeight = PicTxtImageMinHeight;
            }
            
            if (actualHeight>PicTxtImageMaxHeight) {
                actualHeight = PicTxtImageMaxHeight;
            }
            
        }

    }else if (model.rankType==YQHPicTxtWebViewType){
        actualWidth = PicTxtImageMaxWidth;
        actualHeight = PicTxtImageHeight;
    }
    
    
//    if (imgWidth == 0 || imgHeight == 0||imgWidth==imgHeight) {
//
//        if (model.isVideo) {
//            actualWidth = PicTxtImageMaxWidth;
//            actualHeight = actualWidth/2;
//        }else{
//            actualWidth = PicTxtImageWidth;
//            actualHeight = PicTxtImageHeight;
//        }
//
//    }else if(imgWidth>imgHeight){
//
//        //宽 大于 高
//
//        if (model.isVideo) {
//            actualWidth = PicTxtImageMaxWidth;
//            actualHeight = actualWidth/2;
//        }else{
//
//            if (imgWidth > PicTxtImageMaxWidth) {
//
//                actualWidth = PicTxtImageMaxWidth;
//
//            }else if(imgWidth<PicTxtImageMinWidth){
//
//                actualWidth =PicTxtImageMinWidth;
//
//            }
//
//            actualHeight = imgHeight * actualWidth/imgWidth;
//
//            if (actualHeight<PicTxtImageMinHeight) {
//
//                actualHeight = PicTxtImageMinHeight;
//
//            }
//
//        }
//
//    }else{
//
//        //高 大于 宽
//        if(imgHeight > PicTxtImageMaxHeight){
//
//            actualHeight = PicTxtImageMaxHeight;
//
//        }else if(imgHeight<PicTxtImageMinHeight){
//
//            actualHeight = PicTxtImageMinHeight;
//
//        }
//
//        actualWidth =  imgWidth * actualHeight/imgHeight;
//
//        if (actualWidth<PicTxtImageMinWidth) {
//
//            actualWidth = PicTxtImageMinWidth;
//
//        }
//    }
    
    model.actualWidth=actualWidth;
    model.actualHeight=actualHeight;
    
    return actualHeight;
}

//计算评论高度
+(CGFloat)calculateComment:(YQHPicTxtModel*)model{
    if (model.comments.count) {
        if (model.tableViewFrame.size.height) {
            return model.tableViewFrame.size.height;
        }
        CGFloat tableViewH = 0;
        tableViewH+=commentHeaderHeight;
        tableViewH+=commentFooterHeight;
        for (YQHPicTxtCommentModel *comment in model.comments)
        {
            tableViewH+=[YQHPicTxtCommentCell cellHeightWithModel:comment];
        }
        model.tableViewFrame=CGRectMake(marginLeft, model.cellHeight, SCREEN_WIDTH-marginLeft-marginRight, tableViewH);
        return model.tableViewFrame.size.height;
    }
    return 0;
}

- (void)setDelegate:(id<YQHPicTxtToolBarDelegate>)delegate row:(NSIndexPath*)indexPath{
    self.bottomToolBar.delegate=delegate;
    self.bottomToolBar.indexPath=indexPath;
    self.indexPath=indexPath;
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = detailTxtLineSpace; //设置行间距
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
    paraStyle.lineSpacing = detailTxtLineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    CGSize size = [str boundingRectWithSize:CGSizeMake(detailTxtLineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    UIView *view = [touch view];
    if ([view isEqual:self.contentView]||[view isEqual:self.photosView]) {
        [super touchesBegan:touches withEvent:event];
    }
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    if ([NSStringFromClass([touch class]) isEqualToString:@"UITableViewCellContentView"]) {
//        return NO;
//    }
//    return YES;
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//}

@end
