//
//  JSTabBarController.m
//  Ecg2GForPad
//
//  Created by ShenYj on 2017/10/30.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTabBarController.h"
#import "JSRealECGPhoneController.h"

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor js_randomColor];
    [self addChildViewControllers:[JSRealECGPhoneController new] withImageName:nil withTitle:@"实时心电"];
    [self addChildViewControllers:[JSBaseViewController new] withImageName:nil withTitle:@"佩戴记录"];
    [self addChildViewControllers:[JSBaseViewController new] withImageName:nil withTitle:@"短时分析"];
    [self addChildViewControllers:[JSBaseViewController new] withImageName:nil withTitle:@"个人中心"];
}

// 添加子控制器&设置子控制器标题和图片
- (void)addChildViewControllers:(JSBaseViewController *)viewController withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    JSBaseNavigationController *navigationVC = [[JSBaseNavigationController alloc] initWithRootViewController:viewController];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_click",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationVC.tabBarItem.title = title;
    navigationVC.tabBarItem.image = image;
    navigationVC.tabBarItem.selectedImage = selectedImage;
    // 设置tabbarItem字体颜色
    [navigationVC.tabBarItem setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor js_RGBColorWithRed:255 withGreen:205 withBlue:25]}
                                           forState: UIControlStateSelected];
    [self addChildViewController:navigationVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
