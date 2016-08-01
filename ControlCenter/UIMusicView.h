//
//  UIMusicView.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControlCenterSlider.h"
#import "UIMusicControlView.h"

@interface UIMusicView : UIView

@property (nonatomic, strong, readonly) UILabel *musicTitleLabel;
@property (nonatomic, strong, readonly) UILabel *musicLyricsLabel;
@property (nonatomic, strong, readonly) UIMusicControlView *musicControlView;
@property (nonatomic, strong, readonly) UIControlCenterSlider *voiceSlider;

@end
