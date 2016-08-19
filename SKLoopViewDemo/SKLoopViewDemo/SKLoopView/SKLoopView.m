//
//  SKLoopView.m
//  SKLoopViewDemo
//
//  Created by king on 16/8/19.
//  Copyright © 2016年 king. All rights reserved.
//

#import "SKLoopView.h"
#import "SKLoopViewlayout.h"
#import "SKLoopViewCell.h"

NSString * const SKLoopViewCellID = @"SKLoopViewCellID";

@interface SKLoopView ()<UICollectionViewDataSource ,UICollectionViewDelegate>

@end

@implementation SKLoopView {
    NSArray <NSURL *> *_urls;
}

- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls
{
    self = [super initWithFrame:self.bounds collectionViewLayout:[[SKLoopViewlayout alloc] init]];
    if (self) {
        _urls = urls;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[SKLoopViewCell class] forCellWithReuseIdentifier:SKLoopViewCellID];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SKLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SKLoopViewCellID forIndexPath:indexPath];
    cell.url = [_urls objectAtIndex:indexPath.item % _urls.count];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        if (offset == 0) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}
@end
