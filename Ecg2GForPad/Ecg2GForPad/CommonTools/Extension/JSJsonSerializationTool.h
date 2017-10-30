//
//  JSJsonSerializationTool.h
//  Ecg2G
//
//  Created by ecg on 2017/7/26.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSJsonSerializationTool : NSObject

/*!
 *  @metohd js_JSONSerializationToLocation:
 *
 *  @param responseObject      可转换成JSON的数据
 *
 *  @discussion                判断是否可以转换成JSON文件,如果可以,写入到沙盒TEMP中,如果不能,返回 NO
 */
+ (BOOL)js_JSONSerializationToLocation: (id)responseObject;


/*!
 *  @metohd js_JSONSerialization:
 *
 *  @param jsonString      Json字符串
 *
 *  @discussion             json字符串转成字典
 */
+ (id)js_JSONSerialization:(NSString *)jsonString;

@end
