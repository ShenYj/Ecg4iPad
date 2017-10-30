//
//  NSString+JSJSONSerialize.m
//  Ecg2G
//
//  Created by ecg on 2017/7/3.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "NSString+JSJSONSerialize.h"

@implementation NSString (JSJSONSerialize)

- (id)js_JSONStringSerialization
{
    if (self.length > 0) {
        NSError *error;
        NSData *msgData = [[NSData alloc] initWithData:[self dataUsingEncoding:NSUTF8StringEncoding]];
        id result = [NSJSONSerialization JSONObjectWithData:msgData options:NSJSONReadingMutableLeaves error:&error];//解析
        if (error) {
            NSLog(@"解析失败: %@",error);
            return nil;
        }
        return result;
    } 
    return nil;
}

@end
