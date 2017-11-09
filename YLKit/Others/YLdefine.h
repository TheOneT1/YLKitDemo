//
//  YLdefine.h
//  TZTT
//
//  Created by ffss on 2017/9/29.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#ifndef YLdefine_h
#define YLdefine_h


#pragma mark - 系统

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#define YL_IS_iPhone           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define YL_IS_iPad             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define YL_KApplication        [UIApplication sharedApplication]
#define YL_KKeyWindow          [UIApplication sharedApplication].keyWindow
#define YL_KAppDelegate        [UIApplication sharedApplication].delegate
#define YL_KUserDefaults       [NSUserDefaults standardUserDefaults]
#define YL_KNotificationCenter [NSNotificationCenter defaultCenter]
#define YL_KSystemVersion      [[UIDevice currentDevice] systemVersion] floatValue]
#define YL_KAppVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define YL_KAppName            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define YL_KBundleIDKey        [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey]

#pragma mark - 尺寸

#define YL_SCREEN_WITTH [UIScreen mainScreen].bounds.size.width
#define YL_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define YL_IS_IPHONEX ((YL_SCREEN_HEIGHT - 812.f) ? NO : YES)
#define YL_STATUS_HEIGHT 20.f
#define YL_NAV_HEIGHT  64.f
#define YL_TABBAR_HEIGHT 49.f
#define YL_SAFEAREA_STATUS_HEIGHT ((YL_IS_IPHONEX ) ? 44.f : YL_STATUS_HEIGHT)
#define YL_SAFEAREA_NAV_HEIGHT ((YL_IS_IPHONEX ) ? 88.f : YL_NAV_HEIGHT)
#define YL_SAFEAREA_TABBAR_HEIGHT ((YL_IS_IPHONEX ) ? 83.f : YL_TABBAR_HEIGHT)
#define YL_SAFEAREA_JAW_HEIGHT ((YL_IS_IPHONEX ) ? 34.f : 0)
#define YL_SAFEAREA_NET_HEIGHT (YL_SCREEN_HEIGHT - YL_SAFEAREA_NAV_HEIGHT - YL_SAFEAREA_TABBAR_HEIGHT)

#pragma mark - 运用

#define YL_WeakSelf(type)  __weak typeof(type) weak##type = type;
#define YL_StrongSelf(type) __strong typeof(type) type = weak##type;




#endif /* YLdefine_h */
