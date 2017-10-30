//
//  UITabBarController+JSBarHeight.m
//  Ecg2G
//
//  Created by ecg on 2017/9/28.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "UITabBarController+JSBarHeight.h"

@implementation UITabBarController (JSBarHeight)


- (CGFloat)js_tabBarHeight
{
    if ([self isKindOfClass:NSClassFromString(@"JSMainTabBarController")]) {
        JSMainTabBarController *mainTabBarController = (JSMainTabBarController *)self;
        return mainTabBarController.tabBarheight;
    }
    return self.tabBarController.tabBar.frame.size.height;
}

- (CGFloat)js_tabBarOffsetY
{
    if ([self isKindOfClass:NSClassFromString(@"JSMainTabBarController")]) {
        JSMainTabBarController *mainTabBarController = (JSMainTabBarController *)self;
        return mainTabBarController.tabBarOffsetY;
    }
    return 0;
}


@end
