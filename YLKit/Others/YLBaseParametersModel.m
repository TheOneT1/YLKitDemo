//
//  YLBaseParametersModel.m
//  ERY
//
//  Created by ffss on 2017/8/3.
//  Copyright © 2017年 SFB. All rights reserved.
//

#import "YLBaseParametersModel.h"
#import <objc/runtime.h>
@implementation YLBaseParametersModel

- (instancetype)init{
    if (self = [super init]) {
        self.limit = @10;
        self.page = @1;
    }
    return self;
}

- (NSDictionary *)dictinoary{
    
    NSMutableDictionary * para = [NSMutableDictionary new];
    [para setValue:self.page forKey:@"page"];
    [para setValue:self.limit forKey:@"limit"];
    unsigned int count;// 记录属性个数

    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        // KVC
        NSString *value = [self valueForKey:name];
        
//        NSLog(@"name = %@ ,value = %@",name,value);
        
        [para setValue:value forKey:name];
    }
    return para.copy;
}

@end
