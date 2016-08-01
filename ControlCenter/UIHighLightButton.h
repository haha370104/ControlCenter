//
//  AirDropButton.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIHighLightButton : UIButton

@property (nonatomic, copy) void (^action)(UIHighLightButton *);

- (void)setBackgroundColorWithGary;

@end
