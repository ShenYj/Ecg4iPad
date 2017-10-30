//
//  JSDateFormatter.h
//
//  Created by ShenYj on 2016/10/24.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSDateFormatter : NSDateFormatter

+ (instancetype)sharedDateFormatterManager;
+ (instancetype)sharedMainThreadDateFormatterManager;

/*!
 *  @metohd timestampSwitchTime:
 *
 *  @param timestamp      时间戳: 毫秒级
 *
 *  @discussion           将时间戳转换成字符串
 */
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp;


@end
