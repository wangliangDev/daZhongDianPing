//
//  ShopBaseNavigationController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController


//+(void)initialize
//{
//    
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
//}
//
//-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    
//    if (self.childViewControllers.count) { // 隐藏toolbar
//        viewController.hidesBottomBarWhenPushed = YES;
//        
//        // 自定义返回按钮
//        UIButton *btn = [[UIButton alloc] init];
//
//        [btn setBackgroundImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"btn_backItem_click"] forState:UIControlStateHighlighted];
//        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        [btn sizeToFit];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//        
//        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
//        __weak typeof(viewController)Weakself = viewController;
//        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
//    }
//    [super pushViewController:viewController animated:animated];
//}
//
//
- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewDidLoad
{
    
    self.view.backgroundColor = kWhiteColor;
    [self setHidesBottomBarWhenPushed:YES];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
    
    [button setBackgroundImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_backItem_click"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}
@end































