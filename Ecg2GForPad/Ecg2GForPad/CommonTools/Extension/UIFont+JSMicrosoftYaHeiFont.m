//
//  UIFont+JSMicrosoftYaHeiFont.m
//  Ecg2G
//
//  Created by ecg on 2017/9/18.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "UIFont+JSMicrosoftYaHeiFont.h"
#import <CoreText/CoreText.h>
@implementation UIFont (JSMicrosoftYaHeiFont)

//+ (void)load
//{
//    Method method1 = class_getClassMethod([UIFont class], @selector(systemFontOfSize:));
//    Method method2 = class_getClassMethod([UIFont class], @selector(js_MicrosoftYaHeiFontOfSize:));
//    method_exchangeImplementations(method1, method2);
//}

+ (UIFont *)js_MicrosoftYaHeiFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"Microsoft YaHei" size:fontSize];
}

@end
