//
//  AirDropButton.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIHighLightButton : UIView

@property (nonatomic, strong, readonly) UIImageView *backgroundImageView;
@property (nonatomic, strong, readonly) UILabel *title;
@property (nonatomic, assign) BOOL selectedFlag;

- (void)setBackgroundImage:(UIImage *)image;

@end
