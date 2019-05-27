//
//  YQHPicTxtImageView.h
//  love
//
//  Created by 杨棋贺 on 2019/5/22.
//  Copyright © 2019 杨棋贺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BtnClickBlock)(void);

@interface YQHPicTxtImageView : UIImageView

@property (nonatomic, strong) BtnClickBlock btnClick;

@property (nonatomic) BOOL showMenu;

@end

