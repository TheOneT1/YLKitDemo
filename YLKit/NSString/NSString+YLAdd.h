//
//  NSString+YLAdd.h
//  P014
//
//  Created by ffss on 2017/7/7.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

typedef NS_ENUM(NSInteger,DateFormatterStyle) {
    

    yyyy_MM_dd__HH_mm_ss,
    yyyy_MM_dd,
    MM_dd,
    HH_mm,
    
   
};


#import <Foundation/Foundation.h>





@interface NSString (YLAdd)

#pragma NSDate

/**
 判断服务器返回时间和当前时间差距

 @param dateString 服务器返回时间
 @return 时间差字符串
 */
+ (NSString *)distanceForNow:(NSString *)dateString;


/**
 时间简化

 @param dateString 传入服务器时间
 @return 返回 如今天12：20 、今年今月07-08、今年以前2010-09-01
 */
+ (NSString *)simplify:(NSString *)dateString;

/**
 2017-08-21 12:01:01 转化 2017-08-21

 @param dateString 传入的时间时间字符串
 @return 已经转化的时间字符串
 */
+ (NSString *)dateStringOfDateString:(NSString *)dateString WithDateFormatterStyle:(DateFormatterStyle)dateFormatterStyle;



#pragma

@end
