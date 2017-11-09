//
//  UIView+YLChain.m
//  ERY
//
//  Created by ffss on 2017/8/9.
//  Copyright © 2017年 SFB. All rights reserved.
//

#import "UIView+YLChain.h"

@implementation UIView (YLChain)

- (void)yl_makeView:(void(^)(YLViewMake *make))block{

    // 1
    YLViewMake *make = [[YLViewMake alloc] init];
    // 2
    block(make);
    
    // 3
    if (make.bgColor) {
        self.backgroundColor = make.bgColor;
    }
    
    if (!CGRectIsNull(make.frame)) {
         self.frame = make.frame;
    }
   
    // 4
    return;
}

@end





@implementation YLViewMake

- (YLViewMake *(^)(UIColor *color))yl_bgcolor{
    return ^(UIColor *color){
        _bgColor = color;
        return self;
    };
}

- (YLViewMake *(^)(CGRect rect))yl_frame{
    return ^(CGRect rect){
        _frame = rect;
        return  self;
    };
}

@end
