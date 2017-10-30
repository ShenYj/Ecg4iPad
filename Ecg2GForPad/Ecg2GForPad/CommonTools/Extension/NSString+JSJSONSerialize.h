//
//  NSString+JSJSONSerialize.h
//  Ecg2G
//
//  Created by ecg on 2017/7/3.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSJSONSerialize)

/*!
 *  @metohd js_JSONStringSerialization
 *
 *  @return                 返回一个数组或字典
 *  @discussion             对JSON字符串进行解析
 */
- (id)js_JSONStringSerialization;


@end
