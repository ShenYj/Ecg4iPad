//
//  JSBaseViewController.m
//  Ecg2GForPad
//
//  Created by ShenYj on 2017/10/31.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSBaseViewController.h"

@interface JSBaseViewController ()

@end

@implementation JSBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置视图
    [self setUpBaseView];
}

- (void)setUpBaseView
{
    [self prepareCustomNavigationBar];
    [self prepareBaseView];
}

/** 设置标题 */
- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.js_navigationItem.title = title;
}

/** 导航条视图 */
- (void)prepareCustomNavigationBar
{
    [self.view addSubview: self.js_NavigationBar];
    self.js_NavigationBar.items = @[self.js_navigationItem];
    self.js_NavigationBar.barTintColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [self.js_NavigationBar setTitleTextAttributes:@{
                                                    NSFontAttributeName: [UIFont systemFontOfSize:18],
                                                    NSForegroundColorAttributeName: [UIColor orangeColor]}
	];
}
/** 主视图 */
- (void)prepareBaseView
{
    // 设置基类视图背景色
    self.view.backgroundColor = [UIColor whiteColor];
    // 取消穿透
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy

- (UINavigationBar *)js_NavigationBar {
    if (!_js_NavigationBar) {
        _js_NavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavigationBarBaseHeight)];
    }
    return _js_NavigationBar;
}

- (UINavigationItem *)js_navigationItem {
    if (!_js_navigationItem) {
        _js_navigationItem = [[UINavigationItem alloc] init];
    }
    return _js_navigationItem;
}

@end
