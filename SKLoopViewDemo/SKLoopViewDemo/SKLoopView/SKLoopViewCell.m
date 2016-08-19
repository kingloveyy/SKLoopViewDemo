//
//  SKLoopViewCell.m
//  SKLoopViewDemo
//
//  Created by king on 16/8/19.
//  Copyright © 2016年 king. All rights reserved.
//

#import "SKLoopViewCell.h"

@implementation SKLoopViewCell {
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}

- (void)setUrl:(NSURL *)url {
    _url = url;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    _imageView.image = image;
}
@end
