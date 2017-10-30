//
//  NSDate+JSCompare.h
//  Ecg2G
//
//  Created by ecg on 2017/7/13.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JSCompare)

/*!
 *  @metohd dateformatterString:
 *
 *  @param dateformatter        日期格式字符串
 *
 *  @discussion                 将NSDate类型对象转换为特定格式的字符串
 */
- (NSString *)dateformatterString:(NSString *)dateformatter;
/*!
 *  @metohd isYesterday
 *
 *  @discussion                  判断当前NSDate是否是昨天甚至更早的日期
 */
- (BOOL)isYesterdayOrEarlier;

/*!
 *  @metohd isEarlierThanHistoryPacketDate:
 *
 *  @param historyDateString      包状态中的历史时间
 *
 *  @discussion                   和包状态中的历史时间进行比较
 */
- (BOOL)isEarlierThanHistoryPacketDate:(NSString *)historyDateString;

@end
