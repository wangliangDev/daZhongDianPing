//
//  Singleton.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject{
    
    MBProgressHUD *hudView;
}

+(instancetype)shareInstance;
-(void)loadHudView:(UIView*)view;
-(void)stopHudView;

@end
