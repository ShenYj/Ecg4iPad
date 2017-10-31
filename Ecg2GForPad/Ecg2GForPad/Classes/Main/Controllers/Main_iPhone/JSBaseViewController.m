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
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.js_navigationItem.title = title;
}

/** 导航条视图 */
- (void)prepareCustomNavigationBar
{
    [self.view addSubview: self.js_statusBar];
    [self.view addSubview: self.js_NavigationBar];
    [self.view addSubview: self.js_contentView];
    
    self.js_NavigationBar.items = @[self.js_navigationItem];
    self.js_NavigationBar.barTintColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [UIFont systemFontOfSize:18],
                                 NSForegroundColorAttributeName: [UIColor orangeColor]
                                 };
    [self.js_NavigationBar setTitleTextAttributes: attributes];
    self.js_statusBar.backgroundColor = self.js_NavigationBar.barTintColor;
    
    self.js_statusBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.js_contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.js_NavigationBar.translatesAutoresizingMaskIntoConstraints = NO;
    // 控制状态栏的高度
    CGFloat statusBarHeightConstraint = kStatusBarBaseHeight;
    if (IS_IPHONE_X) {
        statusBarHeightConstraint = kStatusBarExtensionHeight;
    }
    // statusBar
    NSLayoutConstraint *statusBarTop = [NSLayoutConstraint constraintWithItem: self.js_statusBar
                                                                    attribute: NSLayoutAttributeTop
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: self.view
                                                                    attribute: NSLayoutAttributeTop
                                                                   multiplier: 1
                                                                     constant: 0];
    [self.view addConstraint:statusBarTop];
    NSLayoutConstraint *statusBarLeft = [NSLayoutConstraint constraintWithItem: self.js_statusBar
                                                                     attribute: NSLayoutAttributeLeft
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.view
                                                                     attribute: NSLayoutAttributeLeft
                                                                    multiplier: 1
                                                                      constant: 0];
    [self.view addConstraint:statusBarLeft];
    NSLayoutConstraint *statusBarRight = [NSLayoutConstraint constraintWithItem: self.js_statusBar
                                                                      attribute: NSLayoutAttributeRight
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.view
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1
                                                                       constant: 0];
    [self.view addConstraint:statusBarRight];
    NSLayoutConstraint *statusBarHeight = [NSLayoutConstraint constraintWithItem: self.js_statusBar
                                                                       attribute: NSLayoutAttributeHeight
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: nil
                                                                       attribute: NSLayoutAttributeNotAnAttribute
                                                                      multiplier: 1
                                                                        constant: statusBarHeightConstraint];
    [self.view addConstraint:statusBarHeight];
    // navigationBar
    NSLayoutConstraint *navigationBarTop = [NSLayoutConstraint constraintWithItem: self.js_NavigationBar
                                                                        attribute: NSLayoutAttributeTop
                                                                        relatedBy: NSLayoutRelationEqual
                                                                           toItem: self.js_statusBar
                                                                        attribute: NSLayoutAttributeBottom
                                                                       multiplier: 1
                                                                         constant: 0];
    [self.view addConstraint:navigationBarTop];
    NSLayoutConstraint *navigationBarLeft = [NSLayoutConstraint constraintWithItem: self.js_NavigationBar
                                                                         attribute: NSLayoutAttributeLeft
                                                                         relatedBy: NSLayoutRelationEqual
                                                                            toItem: self.view
                                                                         attribute: NSLayoutAttributeLeft
                                                                        multiplier: 1
                                                                          constant: 0];
    [self.view addConstraint:navigationBarLeft];
    NSLayoutConstraint *navigationBarRight = [NSLayoutConstraint constraintWithItem: self.js_NavigationBar
                                                                          attribute: NSLayoutAttributeRight
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem: self.view
                                                                          attribute: NSLayoutAttributeRight
                                                                         multiplier: 1
                                                                           constant: 0];
    [self.view addConstraint:navigationBarRight];
    NSLayoutConstraint *navigationBarHeight = [NSLayoutConstraint constraintWithItem: self.js_NavigationBar
                                                                           attribute: NSLayoutAttributeHeight
                                                                           relatedBy: NSLayoutRelationEqual
                                                                              toItem: nil
                                                                           attribute: NSLayoutAttributeNotAnAttribute
                                                                          multiplier: 1
                                                                            constant: self.js_NavigationBar.height];
    [self.view addConstraint:navigationBarHeight];
    // contentView
    //CGFloat contentViewTopConstraint = self.js_statusBar.height + self.js_NavigationBar.height;
    CGFloat contentViewLeftConstraint = IS_IPHONE_X ? 5 : 0;
    CGFloat contentViewRightConstraint = IS_IPHONE_X ? 5 : 0;
    CGFloat contentViewBottomConstraint = IS_IPHONE_X ? 10 : 0;
    
    NSLayoutConstraint *contentViewTop = [NSLayoutConstraint constraintWithItem: self.js_contentView
                                                                      attribute: NSLayoutAttributeTop
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.js_NavigationBar
                                                                      attribute: NSLayoutAttributeBottom
                                                                     multiplier: 1
                                                                       constant: 0];
    [self.view addConstraint:contentViewTop];
    NSLayoutConstraint *contentViewLeft = [NSLayoutConstraint constraintWithItem: self.js_contentView
                                                                       attribute: NSLayoutAttributeLeft
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.view
                                                                       attribute: NSLayoutAttributeLeft
                                                                      multiplier: 1
                                                                        constant: contentViewLeftConstraint];
    [self.view addConstraint:contentViewLeft];
    NSLayoutConstraint *contentViewRight = [NSLayoutConstraint constraintWithItem: self.js_contentView
                                                                        attribute: NSLayoutAttributeRight
                                                                        relatedBy: NSLayoutRelationEqual
                                                                           toItem: self.view
                                                                        attribute: NSLayoutAttributeRight
                                                                       multiplier: 1
                                                                         constant: contentViewRightConstraint];
    [self.view addConstraint:contentViewRight];
    NSLayoutConstraint *contentViewBottom = [NSLayoutConstraint constraintWithItem: self.js_contentView
                                                                         attribute: NSLayoutAttributeBottom
                                                                         relatedBy: NSLayoutRelationEqual
                                                                            toItem: self.view
                                                                         attribute: NSLayoutAttributeBottom
                                                                        multiplier: 1
                                                                          constant: contentViewBottomConstraint];
    [self.view addConstraint:contentViewBottom];
    
    
}
/** 主视图 */
- (void)prepareBaseView
{
    // 设置基类视图背景色
    self.view.backgroundColor = [UIColor js_randomColor];
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
- (UIView *)js_statusBar {
    if (!_js_statusBar) {
        _js_statusBar = [[UIView alloc] init];
    }
    return _js_statusBar;
}
- (UIView *)js_contentView {
    if (!_js_contentView) {
        _js_contentView = [[UIView alloc] init];
        _js_contentView.backgroundColor = [UIColor redColor];
    }
    return _js_contentView;
}

@end
