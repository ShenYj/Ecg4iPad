//
//  NSString+JSPhoneVerification.m
//  Ecg2G
//
//  Created by ecg on 2017/8/4.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "NSString+JSPhoneVerification.h"

@implementation NSString (JSPhoneVerification)

/*** 手机号以13，15，17, 18开头，八个 \d 数字字符 ***/
- (BOOL)isValidateMobileNumber
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

/*** 手机号正则验证 ***/
+ (BOOL)js_validateMobile:(NSString *)mobile
{
    //    //手机号以13，15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    return [phoneTest evaluateWithObject:mobile];
    NSString *stringWithOutSpace = nil;
    if ([mobile containsString:@" "]) {
        stringWithOutSpace = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    } else {
        stringWithOutSpace = mobile;
    }
    NSString *regex = nil;
    if (stringWithOutSpace.length == 11) {
        //regex = @"^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
        regex = @"^1[3|4|5|7|8]\\d{9}$";
    } else {
        regex = @"^(5|6|8|9)\\d{7}$";
    }
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
//    NSString *regex1 = @"^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
//    NSString *regex2 = @"^(5|6|8|9)\\d{7}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@|%@",regex1,regex2];
    return [phoneTest evaluateWithObject:stringWithOutSpace];
}

@end
