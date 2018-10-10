//
//  ViewController.m
//  XYFSnowAnimationDemo
//
//  Created by xyf on 2017/1/30.
//  Copyright © 2017年 XYF. All rights reserved.
//

#import "ViewController.h"
#import "SnowAnimationViewController.h"
#import "FlowerAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)jumpToSnowAnimationPage {
    SnowAnimationViewController *snowAnimationVC = [[SnowAnimationViewController alloc] init];
    [self.navigationController pushViewController:snowAnimationVC animated:YES];
}

- (IBAction)jumpToFlowerAnimationPage {
    FlowerAnimationViewController *flowerAnimationVC = [[FlowerAnimationViewController alloc] init];
    [self.navigationController pushViewController:flowerAnimationVC animated:YES];
}

@end
