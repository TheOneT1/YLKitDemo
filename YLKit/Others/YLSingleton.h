//
//  YLSingleton.h
//  P009_01
//  快速实现一个类的单例
//  Created by fs_work on 2017/5/10.
//  Copyright © 2017年 __MyCompanyName__ All rights reserved.
//

#ifndef YLSingleton_h
#define YLSingleton_h

// .h
#define yl_singleton_interface(class) +(instancetype)sharedInstance;

// .m
#define yl_singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
\
return _instance; \
} \
\
+ (instancetype)sharedInstance \
{ \
if (_instance == nil) { \
_instance = [[class alloc] init]; \
} \
\
return _instance; \
}



#endif /* YLSingleton_h */
