//
//  UIView+Corner.m
//  TZTT
//
//  Created by ffss on 2017/9/19.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)


- (void)cornerRadius:(CGFloat)radius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end
