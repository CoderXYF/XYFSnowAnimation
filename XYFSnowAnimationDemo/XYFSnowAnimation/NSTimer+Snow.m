//
//  NSTimer+Snow.m
//  XYFSnowAnimationExample
//
//  Created by xyf on 2017/1/30.
//  Copyright © 2017年 XYF. All rights reserved.
//

#import "NSTimer+Snow.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
static const CGFloat interval = 0.01f;
static const CGFloat duration = 8.0f;

@implementation NSTimer (Snow)

+ (instancetype)timerWithSnowAnimationInView:(UIView *)view {
    //让背景图不变形且填充
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.layer.contents = (id)[UIImage imageNamed:@"snowBg"].CGImage;
    
    NSTimer *snowTimer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        UIImageView *snowImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow"]];
        [view addSubview:snowImageV];
        //雪花随机生成范围：-0.5倍的屏幕宽度到1.5倍的屏幕宽度范围
        CGFloat startX = arc4random_uniform(screenW * 2 + 1) - screenW * 0.5;
        CGFloat startY = -snowImageV.bounds.size.height;
        snowImageV.frame = CGRectMake(startX, startY, snowImageV.bounds.size.width, snowImageV.bounds.size.height);
        
        [UIView animateWithDuration:duration animations:^{
            //雪花落地再次随机范围：-0.5倍的屏幕宽度到1.5倍的屏幕宽度范围
            CGFloat endX = arc4random_uniform(screenW * 2 + 1) - screenW * 0.5;
            CGFloat endY = screenH;
            snowImageV.frame = CGRectMake(endX, endY, snowImageV.bounds.size.width, snowImageV.bounds.size.height);
            //雪花落地旋转角度：-90度到90度（顺时针为正）
            CGFloat angle = arc4random_uniform(180 + 1) / 180.0 * M_PI - M_PI_2;
            snowImageV.transform = CGAffineTransformMakeRotation(angle);
        } completion:^(BOOL finished) {
            //动画结束移除雪花
            [snowImageV removeFromSuperview];
            //（snowImageV局部变量会被UIView动画的block所强引用，所以每次动画执行结束block销毁时没有谁对他强引用所以他会被销毁，不会出现无限堆积消耗内存）
        }];
    }];
    
    return snowTimer;
}

@end
