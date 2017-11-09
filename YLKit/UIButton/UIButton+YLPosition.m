//
//  UIButton+YLPosition.m
//  TestButton
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import "UIButton+YLPosition.h"

@implementation UIButton (YLPosition)

/**
 变换图片和文字的位置,左右互换
 
 @param spacing 间距
 */
- (void)shifTextAndImgPositionWithSpacing:(CGFloat)spacing{
    
    if (spacing == 0) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0, 0)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0,0, 0, 0)];
        
    }else{
        CGFloat img_w = self.imageView.bounds.size.width;
        CGFloat lab_w = self.titleLabel.bounds.size.width;
        
        img_w  =  img_w + spacing / 2.0;
        lab_w  = lab_w + spacing / 2.0;
       
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,lab_w, 0, -lab_w)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -img_w, 0, img_w)];
    }
}

- (CGSize)resultShifTextAndImgPositionWithSpacing:(CGFloat )spacing{
    
    CGFloat img_w = self.imageView.bounds.size.width;
    CGFloat lab_w = self.titleLabel.bounds.size.width;
    
    if (spacing == 0) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0, 0)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0,0, 0, 0)];
    }else{
      
        img_w  =  img_w + spacing / 2.0;
        lab_w  = lab_w + spacing / 2.0;
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,lab_w, 0, -lab_w)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -img_w, 0, img_w)];
    }
    NSLog(@"total_w = %f",img_w + lab_w );
    return CGSizeMake(img_w + lab_w, self.imageView.bounds.size.height + self.titleLabel.bounds.size.height);
}



/**
 根据传入的图片、标题、间距、动态调整按钮的宽度
 
 @param imgName 图片
 @param titleText 标题
 @param fontSize 标题大小
 @param spacing 图片标题间距
 @param minWidth 按钮最小宽度
 */
- (void)setImageName:(NSString *)imgName WithTitle:(NSString *)titleText WithFontSize:(CGFloat)fontSize WithSpacing:(CGFloat)spacing WithMinWidth:(CGFloat)minWidth{
    
    [self setContentMode:UIViewContentModeCenter];
    if (KSceenSize.width < 375) {
        fontSize = 0.8 * fontSize;
    }
    
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    UIImage *img = [UIImage imageNamed:imgName];
    [self setImage:img forState:normal];
    CGFloat img_w = ceil(img.size.width);
    
    if (titleText.length == 0) {
        return;
    }

    [self setTitle:titleText forState:normal];
    CGRect bounds = [titleText boundingRectWithSize:CGSizeMake(LONG_MAX, LONG_MAX) options:
                     NSStringDrawingTruncatesLastVisibleLine |
                     NSStringDrawingUsesLineFragmentOrigin |
                     NSStringDrawingUsesFontLeading
                                         attributes:
                     [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil];
    
    CGFloat text_w = ceil(bounds.size.width);
    
    CGFloat total_w = img_w + spacing + text_w;
    
    total_w = total_w > minWidth ? total_w : minWidth;
    
    CGFloat position = spacing / 2.0;
    

        
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, total_w, self.frame.size.height)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -position, 0, position)];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, position, 0, -position)];

}

/**
 
 @param offset 紧靠右边
 @param minWidth 按钮最小宽度
 */
- (void)rightImageOffSet:(CGFloat)offset WithMinWidth:(CGFloat)minWidth{
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    CGRect originRect = self.frame;
    self.frame = CGRectMake(self.superview.size.width - minWidth - offset, originRect.origin.y, minWidth, originRect.size.height);
}

/**
 
 @param offset 紧靠左边边
 @param minWidth 按钮最小宽度
 */
- (void)leftImageOffSet:(CGFloat)offset WithMinWidth:(CGFloat)minWidth{
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    CGRect originRect = self.frame;
    self.frame = CGRectMake(offset, originRect.origin.y, minWidth, originRect.size.height);
}



@end
