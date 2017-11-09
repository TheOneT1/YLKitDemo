//
//  YLEdgeLabel.m
//  TZTT
//
//  Created by ffss on 2017/10/17.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import "YLEdgeLabel.h"
static CGFloat top = 0;
static CGFloat bot = 0;
static CGFloat left = 5;
static CGFloat right = 5;

@implementation YLEdgeLabel
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.edgeInsets = UIEdgeInsetsMake(top, left, bot, right);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.edgeInsets = UIEdgeInsetsMake(top, left, bot, right);
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.edgeInsets = UIEdgeInsetsMake(top, left, bot, right);
}

// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    
    /*
     调用父类该方法
     注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
     */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds,
                                                                 self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect{
    //令绘制区域为原始区域，增加的内边距区域不绘制
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
