//
//  ViewController.m
//  SKLoopViewDemo
//
//  Created by king on 16/8/19.
//  Copyright © 2016年 king. All rights reserved.
//

#import "ViewController.h"
#import "SKLoopView.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray <NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
    SKLoopView *loopView = [[SKLoopView alloc] initWithURLs:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.frame.size.width - 40, 200);
    [self.view addSubview:loopView];
}

- (void)loadData {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 5; ++i) {
        NSString *fileName = [NSString stringWithFormat:@"%02d.jpg",(i + 1)];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        [array addObject:url];
    }
    
    _urls = array.copy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
