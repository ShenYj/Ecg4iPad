//
//  UIView+JSExtension.m
//  Ecg2G
//
//  Created by ecg on 2017/9/23.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "UIView+JSExtension.h"

@implementation UIView (JSExtension)

+ (void)logHierarchyWithThisView:(UIView *)theView
{
    NSLog(@"This View Hierarchy recursiveDescription:\n %@",[theView performSelector:@selector(recursiveDescription)]);
}

@end
