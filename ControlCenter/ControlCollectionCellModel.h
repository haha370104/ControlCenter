//
//  ControlCollectionCellModel.h
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ControlCollectionCellModel : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL roundFlag;
@property (nonatomic, assign) BOOL canSelected;
@property (nonatomic, assign) BOOL selectedFlag;

- (instancetype)initWithImageName:(NSString *)imageName roundFlag:(BOOL)roundFlag canSelected:(BOOL)canSelected;

@end
