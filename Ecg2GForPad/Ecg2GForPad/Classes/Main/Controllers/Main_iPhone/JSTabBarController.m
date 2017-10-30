//
//  JSTabBarController.m
//  Ecg2GForPad
//
//  Created by ecg on 2017/10/30.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import "JSTabBarController.h"

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 添加子控制器&设置子控制器标题和图片
- (void)addChildViewControllers:(UIViewController *)viewController withImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_click",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    
    // 设置tabbarItem字体颜色
    [viewController.tabBarItem setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor js_RGBColorWithRed:255 withGreen:205 withBlue:25]}
                                             forState: UIControlStateSelected];
    
    [self addChildViewController:viewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
