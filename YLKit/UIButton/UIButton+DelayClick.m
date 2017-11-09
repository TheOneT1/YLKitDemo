//
//  UIButton+DelayClick.m
//  YLButtonAboutDelay
//
//  Created by ffss on 2017/11/8.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import "UIButton+DelayClick.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation UIButton (DelayClick)

- (NSTimeInterval)timeInterval{
    
    //这里需用OBJC_ASSOCIATION_RETAIN  使用OBJC_ASSOCIATION_ASSIGN会crash
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval{
    objc_setAssociatedObject(self, @selector(timeInterval),@(timeInterval), OBJC_ASSOCIATION_RETAIN);
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    objc_setAssociatedObject(self,_cmd, @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isIgnoreEvent{
    return [objc_getAssociatedObject(self, @selector(isIgnoreEvent)) boolValue];
}

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        SEL selold = @selector(sendAction:to:forEvent:);
        SEL selnew = @selector(mysendAction:to:forEvent:);
        
        Method methold = class_getInstanceMethod(self, selold);
        Method methnew = class_getInstanceMethod(self, selnew);
       
        
        //将methnew的实现添加到系统方法中也就是说将methold方法指针添加成方法methnew
        BOOL isAddMeth = class_addMethod(self, selold, method_getImplementation(methnew), method_getTypeEncoding(methnew));
        if (isAddMeth) {
            //添加成功了说明本类中不存在methnew所以此时必须将新方法的实现指针换成旧方法的，否则新方法将没有实现。
            class_replaceMethod(self, selnew, method_getImplementation(methold),  method_getTypeEncoding(methold));
        }else{
            //添加失败了说明本类中有methnew的实现，此时只需要将methold和methnew的IMP互换一下即可。
            method_exchangeImplementations(methold, methnew);
        }
    });
}

- (void)mysendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{

    self.timeInterval = self.timeInterval == 0?0.5:self.timeInterval;
    if (self.isIgnoreEvent) {
        return;
    }else if(self.timeInterval>0){
        [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
    }
    self.isIgnoreEvent = YES;
    [self mysendAction:action to:target forEvent:event];
}

- (void)resetState{
    [self setIsIgnoreEvent:NO];
}
@end
