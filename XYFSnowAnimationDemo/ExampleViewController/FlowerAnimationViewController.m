//
//  FlowerAnimationViewController.m
//  XYFSnowAnimationDemo
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "FlowerAnimationViewController.h"
#import "NSTimer+XYFSnowAnimation.h"

@interface FlowerAnimationViewController ()

@end

@implementation FlowerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 改变导航栏返回按钮色调
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:251/255.0 green:168/255.0 blue:177/255.0 alpha:1.0];
    // 落花动画
    [NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"flower_bg"] snowImage:[UIImage imageNamed:@"flower"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"flower_bgm" ofType:@"mp3"]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [NSTimer removeSnowAnimation];
}

@end
