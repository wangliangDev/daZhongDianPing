//
//  AppDelegate.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DiscountViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "TTBBTabbarController.h"



@interface AppDelegate (){
    
    
    HomeViewController *homeVC ;
    DiscountViewController *discountVC;
    DiscoverViewController *discoverVC;
    MineViewController *mineVC;
    TTBBTabbarController *tabbar;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    discountVC = [[DiscountViewController alloc]init];
    UINavigationController *discountNav = [[UINavigationController alloc]initWithRootViewController:discountVC];
    
    discoverVC = [[DiscoverViewController alloc]init];
     UINavigationController *discoverNav = [[UINavigationController alloc]initWithRootViewController:discoverVC];
    
    mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    tabbar = [[TTBBTabbarController alloc]init];
    
    NSArray *array = @[homeNav,discountNav,discoverNav,mineNav];
    
    tabbar.buttonCount = (int)array.count;
    tabbar.tabbarBgColor = RGB(248, 248, 248);
    tabbar.titleNormalColor = [UIColor grayColor];
    tabbar.titleSelectedColor = RGB(252, 91, 45);
    
    [tabbar creatButtonWithNormalName:@"dianping_24x24" andSelectName:@"dianping_pressed_24x24" andTitle:@"首页" andIndex:0 ];
    
    [tabbar creatButtonWithNormalName:@"group_24x24" andSelectName:@"group_pressed_24x24" andTitle:@"品质优惠" andIndex:1 ];
    
    [tabbar creatButtonWithNormalName:@"found_24x24" andSelectName:@"found_pressed_24x24" andTitle:@"发现" andIndex:2 ];
    
    [tabbar creatButtonWithNormalName:@"my_24x24" andSelectName:@"my_pressed_24x24" andTitle:@"我的" andIndex:3  ];
    tabbar.itemArray = array;
    
    
    self.window.rootViewController = tabbar;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
