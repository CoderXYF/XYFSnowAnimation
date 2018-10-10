//
//  BaseViewController.m
//  XYFSnowAnimationDemo
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航栏变透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    // 改变导航栏返回按钮色调
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // 去除导航栏返回按钮文字
    self.navigationController.navigationBar.topItem.title = @"";
    // 状态栏样式改为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

@end
