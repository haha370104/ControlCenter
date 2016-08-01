//
//  UIControlCollectionViewFlowLayout.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIControlCollectionViewFlowLayout.h"

@implementation UIControlCollectionViewFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat proposedContentOffsetX = proposedContentOffset.x;
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat resultContentOffsetX = round(proposedContentOffsetX / width) * width;
    return CGPointMake(resultContentOffsetX, 0);
}

@end
