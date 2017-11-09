//
//  UINavigationController+Swizz.m
//  YYLL
//
//  Created by ffss on 2017/7/13.
//  Copyright © 2017年 ffss. All rights reserved.
//

#import "UINavigationController+Swizz.h"
#import <objc/runtime.h>
#import "AppDelegate.h"
@implementation UINavigationController (Swizz)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector = @selector(yl_pushViewController:animated:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success =  class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)yl_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    AppDelegate *KAppdelegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
    if (KAppdelegate.reach) {
        [self yl_pushViewController:viewController animated:YES];
    }else{
        [Dialog toastTop:@"网络异常，请检查网络后重试"];
    }
    
}
@end
