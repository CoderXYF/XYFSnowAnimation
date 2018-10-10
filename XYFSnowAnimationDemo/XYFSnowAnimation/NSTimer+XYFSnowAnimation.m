//
//  NSTimer+XYFSnowAnimation.m
//  XYFSnowAnimationDemo
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "NSTimer+XYFSnowAnimation.h"
#import <AVFoundation/AVFoundation.h>

static const CGFloat interval = 0.02f;
static const CGFloat duration = 8.0f;
// 雪花左右飘动范围距离
static const CGFloat maximumHorizontalDistance = 166;

static AVAudioPlayer *audioPlayer = nil;
static NSTimer *timer = nil;
static UIView *animationView = nil;

@implementation NSTimer (XYFSnowAnimation)

static CGFloat currentContainerViewHeight = 0;

+ (NSTimer *)timerWithSnowAnimationInView:(UIView *)view backgroundImage:(UIImage *)backgroundImage snowImage:(UIImage *)snowImage BGMFilePath:(NSString *)filePath {
    // 当前容器视图宽度
    CGFloat currentContainerViewWidth = view.bounds.size.width;
    currentContainerViewHeight = view.bounds.size.height;
    // 先新添加一个动画视图
    animationView = [[UIView alloc] initWithFrame:view.bounds];
    [view addSubview:animationView];
    // 让背景图不变形且填充
    animationView.contentMode = UIViewContentModeScaleAspectFill;
    animationView.layer.contents = (id)backgroundImage.CGImage;
    /********** 一次性创建好所需要的雪花图层 **********/
    NSMutableArray *snowLayersArray = @[].mutableCopy;
    // 雪花图层数量
    NSInteger snowLayersCount = (NSInteger)duration/interval;
    CGFloat imageWidth = CGImageGetWidth(snowImage.CGImage) / [UIScreen mainScreen].scale;
    CGFloat imageHeight = CGImageGetHeight(snowImage.CGImage) / [UIScreen mainScreen].scale;
    CGFloat startY = -imageHeight;
    for (NSInteger i = 0; i < snowLayersCount; i++) {
        // 每个雪花图层随机横向位置
        CGFloat startX = arc4random_uniform(currentContainerViewWidth + maximumHorizontalDistance + 1) - maximumHorizontalDistance * 0.5;
        CALayer *snowLayer = [[CALayer alloc] init];
        snowLayer.frame = CGRectMake(startX, startY, imageWidth, imageHeight);
        snowLayer.contents = (id)snowImage.CGImage;
        [animationView.layer addSublayer:snowLayer];
        [snowLayersArray addObject:snowLayer];
        // 初始化缩放比例与透明度模拟远近
        CGFloat startScale = (arc4random_uniform(11) + 5) / 10.0;
        snowLayer.transform = CATransform3DScale(snowLayer.transform, startScale, startScale, startScale);
        snowLayer.opacity = startScale * 2 / 3.0 * 0.2 + 0.8;
        // 初始化旋转角度
        // -90度到90度（顺时针为正）
        CGFloat startAngleX = arc4random_uniform(180 + 1) / 180.0 * M_PI - M_PI_2;
        CGFloat startAngleY = arc4random_uniform(180 + 1) / 180.0 * M_PI - M_PI_2;
        // -180度到180度（顺时针为正）
        CGFloat startAngleZ = arc4random_uniform(360 + 1) / 360.0 * M_PI * 2 - M_PI;
        snowLayer.transform = CATransform3DRotate(snowLayer.transform, startAngleX, 1, 0, 0);
        snowLayer.transform = CATransform3DRotate(snowLayer.transform, startAngleY, 0, 1, 0);
        snowLayer.transform = CATransform3DRotate(snowLayer.transform, startAngleZ, 0, 0, 1);
    }
    // 创建定时器
    timer = [NSTimer timerWithTimeInterval:interval target:self selector:@selector(timerFire:) userInfo:snowLayersArray repeats:YES];
    // 将定时器添加进当前运行循环（开启定时器）
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    // 播放背景音乐
    [self playBGMWithFilePath:filePath];
    return timer;
}

static NSInteger snowIndex = 0;
+ (void)timerFire:(NSTimer *)timer {
    // 创建定时器持续下落雪花
    // 依次取出雪花图层
    NSMutableArray *snowLayersArray = timer.userInfo;
    CALayer *snowLayer = snowLayersArray[snowIndex];
    snowIndex++;
    if (snowIndex == snowLayersArray.count) {
        snowIndex = 0;
    }
    /********** 图层核心动画 **********/
    // 在最大横向移动范围内随机位置
    CGFloat endX = snowLayer.frame.origin.x + arc4random_uniform(maximumHorizontalDistance + 1) - maximumHorizontalDistance * 0.5;
    CGFloat endY = currentContainerViewHeight;
    // 雪花落入终点旋转角度
    // -90度到90度（顺时针为正）
    CGFloat endAngleX = arc4random_uniform(180 + 1) / 180.0 * M_PI - M_PI_2;
    CGFloat endAngleY = arc4random_uniform(180 + 1) / 180.0 * M_PI - M_PI_2;
    // -180度到180度（顺时针为正）
    CGFloat endAngleZ = arc4random_uniform(360 + 1) / 360.0 * M_PI * 2 - M_PI;
    // 缩放比例
    CGFloat endScale = (arc4random_uniform(11) + 5) / 10.0;
    // 左右平移动画
    CABasicAnimation *leftAndRightTranslationAnimation = [CABasicAnimation animation];
    leftAndRightTranslationAnimation.keyPath = @"position.x";
    leftAndRightTranslationAnimation.toValue = @(endX);
    // 下平移动画
    CABasicAnimation *downwardTranslationAnimation = [CABasicAnimation animation];
    downwardTranslationAnimation.keyPath = @"position.y";
    downwardTranslationAnimation.toValue = @(endY);
    // 比例转化和透明度模拟远近飘落
    // 比例缩放
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.toValue = @(endScale);
    // 透明度变化
    CABasicAnimation *transparencyAnimation = [CABasicAnimation animation];
    transparencyAnimation.keyPath = @"transform.opacity";
    transparencyAnimation.toValue = @(endScale * 2 / 3.0 * 0.2 + 0.8);
    // 旋转动画
    // 绕X轴
    CABasicAnimation *rotationAnimationX = [CABasicAnimation animation];
    rotationAnimationX.keyPath = @"transform.rotation.x";
    rotationAnimationX.toValue = @(endAngleX);
    // 绕Z轴
    CABasicAnimation *rotationAnimationY = [CABasicAnimation animation];
    rotationAnimationY.keyPath = @"transform.rotation.y";
    rotationAnimationY.toValue = @(endAngleY);
    // 绕Z轴
    CABasicAnimation *rotationAnimationZ = [CABasicAnimation animation];
    rotationAnimationZ.keyPath = @"transform.rotation.z";
    rotationAnimationZ.toValue = @(endAngleZ);
    // 添加进动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[leftAndRightTranslationAnimation, downwardTranslationAnimation, scaleAnimation, transparencyAnimation, rotationAnimationX, rotationAnimationY, rotationAnimationZ];
    group.duration = duration;
    group.removedOnCompletion = YES;
    // 添加动画
    [snowLayer addAnimation:group forKey:nil];
}

+ (void)playBGMWithFilePath:(NSString *)filePath {
    if (!filePath.length) {
        return;
    }
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:filePath] error:NULL];
    audioPlayer.numberOfLoops = -1;
    [audioPlayer play];
}

+ (void)removeSnowAnimation {
    // 移除定时器
    [timer invalidate];
    timer = nil;
    // 移除动画视图
    [animationView removeFromSuperview];
    animationView = nil;
    // 移除音频播放器
    [audioPlayer stop];
    audioPlayer = nil;
}

@end
