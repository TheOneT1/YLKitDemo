//
//  UIButton+YLImgAnimation.h
//  AniationButton
//
//  Created by fs_work on 2017/5/25.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLImgAnimation)

/**
 正常使用button，调用方法selectedImageAnimation实现点击缩放切换图片动画
 */
- (void)selectedImageAnimation;

/**
 Audio播放动画
 */
- (void)settAnimationImgs:(NSArray *)imgs WithDuration:(CGFloat)duration WithDurationInfoFont:(CGFloat)fontSize WithMargin:(CGFloat)margin WithSpacing:(CGFloat)spacing WithUrl:(NSString *)url;
@end
