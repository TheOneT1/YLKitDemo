//
//  UIImage+YLAdd.m
//  UIGraphicsBeginImageContext
//
//  Created by fs_work on 2017/5/27.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import "UIImage+YLAdd.h"

@implementation UIImage (YLAdd)


// 放大image
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat )scale{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scale, image.size.height *scale));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scale, image.size.height *scale)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
    
}

// 截取view生成image
+ (UIImage *)captureView:(UIView *)view{
    
    CGRect viewBounds = view.bounds;
    UIGraphicsBeginImageContextWithOptions(viewBounds.size, NO, 0.0);// 0.0原图
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

// 合并2张图 默认上下拼接

+ (UIImage *)combineImageA:(UIImage *)imgA WithImage:(UIImage *)imgB{
    
    CGRect rect = CGRectMake(0, 0, imgA.size.width, imgA.size.height + imgB.size.height);
    UIGraphicsBeginImageContext(rect.size);
    [imgA drawInRect:CGRectMake(0, 0, imgA.size.width, imgA.size.height)];
    [imgB drawInRect:CGRectMake(0, imgA.size.height, imgB.size.width, imgB.size.height)];
    UIImage *combineImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return combineImage;
    
}

// 存储图片
+ (void)saveToDoumentsWithImage:(UIImage *)image{
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"img.png"];
    [UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
    
}

// 截屏保存到相册
+ (void)saveScreenToPhotosAlbumWithView:(UIView *)view{
    UIImageWriteToSavedPhotosAlbum([self captureView:view], self, nil, nil);
    
}

// 截取图片部分区域
- (UIImage *)capturePartOfImage:(UIImage *)originalImage WithRect:(CGRect )rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale  = [UIScreen mainScreen].scale;
    
    CGFloat x = rect.origin.x * scale;
    CGFloat y = rect.origin.y * scale;
    CGFloat w = rect.size.width * scale;
    CGFloat h = rect.size.height * scale;
    
    CGRect newImgRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = originalImage.CGImage;
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, newImgRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    return newImage;
    
}

// 生成一个颜色的图片
- (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize )size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  img;
    
}

/**
 根据文字生成水印图片
 
 @param imageName 图片
 @param str 水印文字
 @param point 绘制水印文字的起始点
 @param dict 水印文字的属性字典
 @return 返回图片
 */
+ (UIImage *)imageWithWaterMarkImage:(NSString *)imageName text:(NSString *)str textPoint:(CGPoint)point textAttributes:(NSDictionary *)dict
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //把图片画上去
    [image drawAtPoint:CGPointZero];
    
    //绘制文字到图片
    [str drawAtPoint:point withAttributes:dict];
    
    // 从上下文获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return imageWater;
}


/**
 根据图片生成水印图片
 
 @param image 图片
 @param waterImage 水印图片
 @param rect 水印图片的位置
 @return 返回图片
 */
+ (UIImage *)imageWithWaterMarkImage:(UIImage *)image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect{
    
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.绘制背景图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //绘制水印图片到当前上下文
    [waterImage drawInRect:rect];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

// 线性渐变色
+ (UIImage *)drawLinearGradientWithRect:(CGRect)rect StartColor:(UIColor *)sColor endColor:(UIColor *)eColor{
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    // 创建CGmutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 绘制path
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetHeight(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetHeight(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetMinY(rect));
    CGPathCloseSubpath(path);
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    NSArray *colors = @[(__bridge id)sColor.CGColor,(__bridge id)eColor.CGColor];

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMaxY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(gc);
    CGContextAddPath(gc, path);
    CGContextClip(gc);
    CGContextDrawLinearGradient(gc, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(gc);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGPathRelease(path);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

@end
