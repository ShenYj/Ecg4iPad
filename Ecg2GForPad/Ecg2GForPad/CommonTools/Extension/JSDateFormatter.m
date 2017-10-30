//
//  JSDateFormatter.m
//
//  Created by ShenYj on 2016/10/24.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSDateFormatter.h"

static JSDateFormatter *_instanceType = nil;
static JSDateFormatter *_mainThreadInstanceType = nil;

@implementation JSDateFormatter

+ (instancetype)sharedMainThreadDateFormatterManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mainThreadInstanceType = [[self alloc] init];
        [_mainThreadInstanceType setDateStyle:NSDateFormatterMediumStyle];
        [_mainThreadInstanceType setTimeStyle:NSDateFormatterShortStyle];
        _mainThreadInstanceType.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        _mainThreadInstanceType.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _mainThreadInstanceType.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        _mainThreadInstanceType.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];// [NSTimeZone systemTimeZone];
    });
    return _mainThreadInstanceType;
}

+ (instancetype)sharedDateFormatterManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceType = [[self alloc] init];
        // 设置地区 (不设置真机下可能出现时间不准确,模拟器不受影响)
//        _instanceType.locale = [NSLocale currentLocale];
//        _instanceType.locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale currentLocale] localeIdentifier]];
        [_instanceType setDateStyle:NSDateFormatterMediumStyle];
        [_instanceType setTimeStyle:NSDateFormatterShortStyle];
        _instanceType.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        _instanceType.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _instanceType.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        _instanceType.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];// [NSTimeZone systemTimeZone];
    });
    return _instanceType;
}

#pragma mark - 将某个时间戳转化成 时间

+ (NSString *)timestampSwitchTime:(NSInteger)timestamp
{
    NSDateFormatter *formatter = [JSDateFormatter sharedDateFormatterManager];//[[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
//    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp * 0.001];
    formatter.dateFormat = @"MM-dd HH:mm:ss";
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"时间转化后 : %@", confromTimespStr);
    return confromTimespStr;
    
}

@end
