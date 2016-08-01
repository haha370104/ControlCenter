//
//  UIButtonCollectionViewCell.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIHighLightButton.h"
#import <UIKit/UIKit.h>

@interface UIButtonCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIHighLightButton *cellButton;
@property (nonatomic, assign) Boolean roundFlag;

- (void)setBackGroundImage:(UIImage *)backgroundImage;

@end
