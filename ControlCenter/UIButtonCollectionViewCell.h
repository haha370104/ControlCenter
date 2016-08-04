//
//  UIButtonCollectionViewCell.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIHighLightButton.h"
#import "UIHighLightUnSelectableButton.h"
#import <UIKit/UIKit.h>

@interface UIButtonCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIHighLightButton *cellButton;
@property (nonatomic, assign) BOOL roundFlag;
@property (nonatomic, assign) BOOL buttonCanSelectedFlag;
@property (nonatomic, assign) BOOL buttonSelectedFlag;

- (void)setBackGroundImage:(UIImage *)backgroundImage;

@end
