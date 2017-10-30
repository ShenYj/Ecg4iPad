//
//  NSString+JSFileSize.h
//  ShenYj
//
//  Created by ShenYj on 2017/8/25.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString * const ECGUpdateFileDocument;       // 存放ECG升级文件的文件夹 (中间路径)
UIKIT_EXTERN NSString * const ECGOTAPlistFileName;         // 存放ECG升级文件记录plist文件名

@interface NSString (JSFileSize)

/*!
 *  @metohd fileSize
 *
 *  @discussion             返回文件或文件夹的大小,单位B
 */
- (unsigned long long)fileSize;

/*!
 *  @metohd logFileSize
 *
 *  @discussion             控制台打印文件或文件夹大小
 */
- (void)logFileSize;

/*!
 *  @metohd cachePath
 *
 *  @discussion             返回沙盒的Cache路径
 */
+ (NSString *)cachePath;

/*!
 *  @metohd ECTOTADocumentPath
 *
 *  @discussion             返回存放ECG OTA升级文件和缓存列表的文件夹路径
 */
+ (NSString *)ECG_OTADocumentPath;

@end
