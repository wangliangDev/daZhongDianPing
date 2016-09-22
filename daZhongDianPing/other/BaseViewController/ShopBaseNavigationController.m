//
//  ShopBaseNavigationController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "ShopBaseNavigationController.h"

@implementation ShopBaseNavigationController


+(void)initialize
{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count) { // 隐藏toolbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 自定义返回按钮
        UIButton *btn = [[UIButton alloc] init];
//        [btn setImage:[UIImage imageNamed:@"btn_back_46x46"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_46x46"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];
}

@end
