//
//  UITabBarController+JSBarHeight.h
//  Ecg2G
//
//  Created by ecg on 2017/9/28.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (JSBarHeight)


/*!
 *  @metohd js_tabBarHeight
 *
 *  @discussion             返回TabBar的高度
 */
- (CGFloat)js_tabBarHeight;

/*!
 *  @metohd js_tabBarOffsetY
 *
 *  @discussion             返回TabBarItem的垂直偏移量
 */
- (CGFloat)js_tabBarOffsetY;


@end
