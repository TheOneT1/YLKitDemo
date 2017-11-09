
//
//  UIButton+YLPosition.h
//  TestButton
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLPosition)

/**
 变换图片和文字的位置,左右互换

 @param spacing 间距
 */
- (void)shifTextAndImgPositionWithSpacing:(CGFloat )spacing;
/**
 变换图片和文字的位置,左右互换
 return 是自适应的size
 @param spacing 间距
 */
- (CGSize)resultShifTextAndImgPositionWithSpacing:(CGFloat )spacing;

/**
 根据传入的图片、标题、间距、动态调整按钮的宽度

 @param imgName 图片
 @param titleText 标题
 @param fontSize 标题大小
 @param spacing 图片标题间距
 @param minWidth 按钮最小宽度
 */
- (void)setImageName:(NSString *)imgName WithTitle:(NSString *)titleText WithFontSize:(CGFloat)fontSize WithSpacing:(CGFloat)spacing WithMinWidth:(CGFloat)minWidth;

/**

 @param offset 紧靠右边
 @param minWidth 按钮最小宽度
 */
- (void)rightImageOffSet:(CGFloat)offset WithMinWidth:(CGFloat)minWidth;


/**
 
 @param offset 紧靠右边边
 @param minWidth 按钮最小宽度
 */
- (void)leftImageOffSet:(CGFloat)offset WithMinWidth:(CGFloat)minWidth;

@end
