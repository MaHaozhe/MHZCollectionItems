//
//  BaseNavigationController.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 为子控制器添加自定义返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //非根控制器
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //必须放下边，不然会消失（不知道为什么）
    [super pushViewController:viewController animated:animated];
}

@end
