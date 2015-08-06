//
//  ZXRLineLayout.m
//  图片浏览器
//
//  Created by zuo on 15/8/6.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "ZXRLineLayout.h"

@implementation ZXRLineLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 50;
    
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        CGFloat delta = ABS(centerX - attrs.center.x);
        
        CGFloat scale = 1.5 - delta / self.collectionView.frame.size.width;
        
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat Margin = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(Margin) > ABS(attrs.center.x - centerX)) {
            Margin = attrs.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += Margin;
    return proposedContentOffset;
}

@end
