//
//  NSString+JSPhoneVerification.h
//  Ecg2G
//
//  Created by ecg on 2017/8/4.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSPhoneVerification)


/*!
 *  @metohd isValidateMobileNumber
 *
 *  @discussion             正则手机号验证
 */
- (BOOL)isValidateMobileNumber;

+ (BOOL)js_validateMobile:(NSString *)mobile;

@end
