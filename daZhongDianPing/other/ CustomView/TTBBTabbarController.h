//
//  TTBBTabbarController.h
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TTBBButton : UIButton

@end


@interface TTBBTabbarController : UITabBarController{
    
    
}

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index;

@property(nonatomic,strong)NSArray *itemArray;
@property(nonatomic,assign)int buttonCount;
@property(nonatomic,strong)UIColor *tabbarBgColor;
@property(nonatomic,strong)UIColor *titleNormalColor;
@property(nonatomic,strong)UIColor *titleSelectedColor;

@end
