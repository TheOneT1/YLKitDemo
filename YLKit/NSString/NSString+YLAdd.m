//
//  NSString+YLAdd.m
//  P014
//
//  Created by ffss on 2017/7/7.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "NSString+YLAdd.h"

@implementation NSString (YLAdd)

+ (NSString *)distanceForNow:(NSString *)dateString{
    
//    NSLog(@"dateString = %@",dateString);
    
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *oldDate = [dateFomatter dateFromString:dateString];
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *dateCom = [calendar components:unit fromDate:oldDate toDate: [NSDate date] options:0];
    
    if (dateCom.year > 0 ) {
          return [NSString stringWithFormat:@"%zd年前",dateCom.year];
    }
    if (dateCom.month > 0) {
           return [NSString stringWithFormat:@"%zd月前",dateCom.month];
    }
    if (dateCom.day > 0) {
        return [NSString stringWithFormat:@"%zd天前",dateCom.day];
    }
    if (dateCom.hour > 0) {
        return [NSString stringWithFormat:@"%zd小时前",dateCom.hour];
    }
    if (dateCom.minute > 0) {
        return [NSString stringWithFormat:@"%zd分钟前",dateCom.minute];
    }
    if (dateCom.second > 0) {
        return [NSString stringWithFormat:@"%zd秒前",dateCom.second];
    }
    return dateString;
}

/**
 时间简化
 
 @param dateString 传入服务器时间
 @return 返回 如 今天12：20 、今年今月07-08、今年以前2010-09-01
 */
+ (NSString *)simplify:(NSString *)dateString{
    
    NSLog(@"dateString = %@",dateString);
    
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *oldDate = [dateFomatter dateFromString:dateString];
    
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    
    NSDateFormatter *toDateFomatter = [[NSDateFormatter alloc] init];
    NSDateComponents *fromdateCom = [calendar components:unit fromDate:oldDate];
    NSDateComponents *nowDateCom = [calendar components:unit fromDate:[NSDate date]];
    
    if (fromdateCom.year == nowDateCom.year) {
        
        if (fromdateCom.month == nowDateCom.month) {
            
            if (fromdateCom.day == nowDateCom.day) {
                
                toDateFomatter.dateFormat = @"HH:mm";
                return [toDateFomatter stringFromDate:oldDate];
                
            }else{
                toDateFomatter.dateFormat = @"MM-dd";
                return [toDateFomatter stringFromDate:oldDate];
            }
            
        }else{
            
            toDateFomatter.dateFormat = @"MM-dd";
            return [toDateFomatter stringFromDate:oldDate];
        }
        
    }else{
        toDateFomatter.dateFormat = @"yyyy-MM-dd";
        return [toDateFomatter stringFromDate:oldDate];
    }

    return dateString;

}

+ (NSString *)dateStringOfDateString:(NSString *)dateString WithDateFormatterStyle:(DateFormatterStyle)dateFormatterStyle{
    
    NSDateFormatter *fromDateFomatter = [[NSDateFormatter alloc] init];
    fromDateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *fromDate = [fromDateFomatter dateFromString:dateString];
    
    NSDateFormatter *toDateFromatter = [[NSDateFormatter alloc] init];
    if (dateFormatterStyle == yyyy_MM_dd) {
       toDateFromatter.dateFormat = @"yyyy-MM-dd";
    }
    if (dateFormatterStyle == MM_dd) {
        toDateFromatter.dateFormat = @"MM-dd";
    }
    if (dateFormatterStyle == HH_mm) {
        toDateFromatter.dateFormat = @"HH:mm";
    }
    
    NSString *resultDateString = [toDateFromatter stringFromDate:fromDate];
    
    NSLog(@"dateString = %@ , resultDateString = %@",dateString,resultDateString);
    return resultDateString;
}

@end
