//
//  NSDate+JSCompare.m
//  Ecg2G
//
//  Created by ecg on 2017/7/13.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "NSDate+JSCompare.h"

@implementation NSDate (JSCompare)

/*** 是否是昨天数据,甚至更早的数据 ***/
- (BOOL)isYesterdayOrEarlier
{
    NSDateComponents *components = [self dateComponentsToNow];
    return components.year >= 0 && components.month >= 0 && components.day >= 1;
}

/*** 日期比较 传入的NSDate对象和[NSDate date]的比较返回值 ***/
- (NSDateComponents *)dateComponentsToNow
{
    NSString *selfString = [self dateformatterString:@"yyyy-MM-dd"];
    NSDate *selfDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:selfString];
    
    if (selfDate == nil) {
        NSLog(@"转换失败 , selfDate为空");
    }
//    NSString *nowString = [[NSDate date] dateformatterString:@"yyyy-MM-dd"];
//    NSDate *nowDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:nowString];
    
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unit fromDate:selfDate toDate:[NSDate date] options:0];
    
    return components;
}
/*** 是否早于包状态中的历史时间 ***/
- (BOOL)isEarlierThanHistoryPacketDate:(NSString *)historyDateString
{
    if ([historyDateString isEqualToString:@"NULL"]) {
        return NO;
    }
    NSDateComponents *components = [self dateComponentsToDateString:historyDateString];
    return components.year >= 0 && components.month >= 0 && components.day >= 1;
}
/*** 日期比较 传入的NSDate对象和 传入日期 的比较返回值 ***/
- (NSDateComponents *)dateComponentsToDateString:(NSString *)dateString
{
    NSString *selfString = [self dateformatterString:@"yyyy-MM-dd"];
    NSDate *selfDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:selfString];
    [JSDateFormatter sharedDateFormatterManager].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [[JSDateFormatter sharedDateFormatterManager] dateFromString:dateString];
    //NSLog(@"       selfDate: %@ --  Date:%@     ", selfDate,date);
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unit fromDate:selfDate toDate:date options:0];
    
    return components;
}

/*** 将当前date转换为特定格式的字符串date ***/
- (NSString *)dateformatterString:(NSString *)dateformatter
{
    [JSDateFormatter sharedDateFormatterManager].dateFormat = dateformatter;
    return [[JSDateFormatter sharedDateFormatterManager] stringFromDate:self];
}

@end
