//
//  SKLoopViewlayout.m
//  SKLoopViewDemo
//
//  Created by king on 16/8/19.
//  Copyright © 2016年 king. All rights reserved.
//

#import "SKLoopViewlayout.h"

@implementation SKLoopViewlayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled  = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}

@end
