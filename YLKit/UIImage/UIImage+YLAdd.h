//
//  UIImage+YLAdd.h
//  UIGraphicsBeginImageContext
//
//  Created by fs_work on 2017/5/27.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLAdd)

// 放大image
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat )scale;

//// 截取view生成image
+ (UIImage *)captureView:(UIView *)view;

// 合并2张图 默认上下拼接
+ (UIImage *)combineImageA:(UIImage *)imgA WithImage:(UIImage *)imgB;

// 存储图片
+ (void)saveToDoumentsWithImage:(UIImage *)image;

// 截屏保存到相册
+ (void)saveScreenToPhotosAlbumWithView:(UIView *)view;

// 截取图片部分区域
//+ (UIImage *)capturePartOfImage:(UIImage *)originalImage WithRect:(CGRect )rect;

// 添加水印
+ (UIImage *)imageWithWaterMarkImage:(UIImage *)image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect;

// 线性渐变色
+ (UIImage *)drawLinearGradientWithRect:(CGRect)rect StartColor:(UIColor *)sColor endColor:(UIColor *)eColor;
@end
