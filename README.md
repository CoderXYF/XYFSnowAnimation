# XYFSnowAnimation
A category of NSTimer for showing 3D Fluttered animation, which is used very simply.3D三维飘落下雪落花动画，性能安全，定时器NSTimer分类，直接使用，很简单  
  
  Usage
==============

### Add snow(Falling flower) animation
```objc
// Snow
[NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"snow_bg"] snowImage:[UIImage imageNamed:@"snow"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"snow_bgm" ofType:@"mp3"]]
// Falling flower:
[NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"flower_bg"] snowImage:[UIImage imageNamed:@"flower"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"flower_bgm" ofType:@"mp3"]];
```  
### remove snow(Falling flower) animation
```objc
[NSTimer removeSnowAnimation];
```

Installation
==============

### CocoaPods

1. Add `pod 'XYFSnowAnimation'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<NSTimer+XYFSnowAnimation.h\>.

### Manually

1. Download XYFSnowAnimation and find XYFSnowAnimationDemo/XYFSnowAnimation finder.
2. Add the source files to your Xcode project.
3. Import `NSTimer+XYFSnowAnimation.h`.

Requirements
==============
This library requires `iOS 8.0+`.

License
==============
XYFSnowAnimation is provided under the MIT license. See LICENSE file for details.  

  使用
==============

### 添加下雪（落花）动画
```objc
// 下雪
[NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"snow_bg"] snowImage:[UIImage imageNamed:@"snow"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"snow_bgm" ofType:@"mp3"]]
// 落花:
[NSTimer timerWithSnowAnimationInView:self.view backgroundImage:[UIImage imageNamed:@"flower_bg"] snowImage:[UIImage imageNamed:@"flower"] BGMFilePath:[[NSBundle mainBundle] pathForResource:@"flower_bgm" ofType:@"mp3"]];
```  
### 移除下雪（落花）动画
```objc
[NSTimer removeSnowAnimation];
```

安装
==============

### CocoaPods

1. 在 Podfile 中添加 `pod 'XYFSnowAnimation'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<NSTimer+XYFSnowAnimation.h\>。

### 手动安装

1. 下载 XYFSnowAnimation 并找到 XYFSnowAnimationDemo/XYFSnowAnimation 文件夹。
2. 将 XYFSnowAnimation 文件夹内的源文件添加(拖放)到你的工程。
3. 导入 `NSTimer+XYFSnowAnimation.h`。

系统要求
==============
该工具最低支持 `iOS 8.0`。

许可证
==============
XYFSnowAnimation 使用 MIT 许可证，详情见 LICENSE 文件。 
# Preview:
![img](https://github.com/CoderXYF/XYFSnowAnimation/blob/master/previewEffectGIFImage/snow.gif)　　![img](https://github.com/CoderXYF/XYFSnowAnimation/blob/master/previewEffectGIFImage/fallingFlower.gif)  

# Contact me (联系我)  
QQ：2016003298  
微信（WeChat）：yz33915958
