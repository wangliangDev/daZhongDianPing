//
//  Singleton.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton


+(instancetype)shareInstance
{
    static id instance;
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        instance = [[[self class] alloc]init];
    });
    
    return instance;
    
}

-(id)init{
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
    
}

-(void)loadHudView:(UIView*)view
{
    
    hudView = [[MBProgressHUD alloc]initWithView:view];
    hudView.labelText = @"正在加载...";
    [hudView show:YES];
    [view addSubview:hudView];
}
-(void)stopHudView
{
    
    [hudView hide:YES];
    [hudView removeFromSuperview];
    hudView = nil;
}
@end
