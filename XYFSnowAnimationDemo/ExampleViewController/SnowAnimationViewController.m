//
//  SnowAnimationViewController.m
//  XYFSnowAnimationDemo
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "SnowAnimationViewController.h"
#import "NSTimer+XYFSnowAnimation.h"

@interface SnowAnimationViewController ()

@end

@implementation SnowAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 下雪动画
    [NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"snow_bg"] snowImage:[UIImage imageNamed:@"snow"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"snow_bgm" ofType:@"mp3"]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [NSTimer removeSnowAnimation];
}

@end
