//
//  ViewController.m
//  XYFSnowAnimationDemo
//
//  Created by xyf on 2017/1/30.
//  Copyright © 2017年 XYF. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+Snow.h"

@interface ViewController ()

@property (nonatomic, weak) NSTimer *snowTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.snowTimer = [NSTimer timerWithSnowAnimationInView:self.view];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.snowTimer invalidate];
}

@end
