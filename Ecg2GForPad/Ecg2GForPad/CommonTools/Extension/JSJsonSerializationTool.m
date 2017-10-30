//
//  JSJsonSerializationTool.m
//  Ecg2G
//
//  Created by ecg on 2017/7/26.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "JSJsonSerializationTool.h"

@implementation JSJsonSerializationTool

+ (BOOL)js_JSONSerializationToLocation: (id)responseObject
{
    if (![NSJSONSerialization isValidJSONObject:responseObject]) {
        return NO;
    }
    
    NSString *pathString = NSTemporaryDirectory();
    //[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"responseJsonObject"];
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    [data writeToFile:pathString atomically:YES];
    
    return YES;
}


+ (id)js_JSONSerialization:(NSString *)jsonString
{
    if ( ![jsonString isKindOfClass:[NSString class]]) {
        NSLog(@"传入参数数据格式不匹配, 该数据类型为: %@",[jsonString class]);
    }
    
    if (String_IS_NIL(jsonString)) {
        return nil;
    }
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return json;
}

@end
