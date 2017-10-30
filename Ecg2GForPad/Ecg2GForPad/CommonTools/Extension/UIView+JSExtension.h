//
//  UIView+JSExtension.h
//  Ecg2G
//
//  Created by ecg on 2017/9/23.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JSExtension)

/*!
 *  @metohd logHierarchyWithThisView:
 *
 *  @param theView      View视图
 *
 *  @discussion         输出这个视图的层级结构
 */
+ (void)logHierarchyWithThisView:(UIView *)theView;

@end
