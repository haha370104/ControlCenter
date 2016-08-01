//
//  ControlCollectionCellModel.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "ControlCollectionCellModel.h"

@implementation ControlCollectionCellModel

- (instancetype)initWithImageName:(NSString *)imageName roundFlag:(Boolean)roundFlag canSelected:(Boolean)canSelected
{
    self = [super init];
    if(self){
        self.image = [UIImage imageNamed:imageName];
        self.roundFlag = roundFlag;
        self.canSelected = canSelected;
        self.selectedFlag = NO;
    }
    return self;
}

@end
