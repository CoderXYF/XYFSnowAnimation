//
//  NSTimer+XYFSnowAnimation.h
//  XYFSnowAnimationDemo
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (XYFSnowAnimation)

/**
 持续下雪动画
 
 @param view 展示动画所在视图
 @param backgroundImage 动画背景图
 @param snowImage 动画图
 @param filePath 背景音乐文件本地路径
 @return 持续执行动画的定时器
 */
+ (NSTimer *)timerWithSnowAnimationInView:(UIView *)view backgroundImage:(UIImage *)backgroundImage snowImage:(UIImage *)snowImage BGMFilePath:(NSString *)filePath;

/**
 移除动画
 */
+ (void)removeSnowAnimation;

@end

NS_ASSUME_NONNULL_END
