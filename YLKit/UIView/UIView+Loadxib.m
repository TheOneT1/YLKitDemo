//
//  UIView+Loadxib.m
//  miaotu
//
//  Created by ffss on 2017/8/23.
//  Copyright © 2017年 miaotu. All rights reserved.
//

#import "UIView+Loadxib.h"

@implementation UIView (Loadxib)
+ (UIView *)loadxibName:(NSString *)xibName{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil];
    return views.lastObject;
}
@end
