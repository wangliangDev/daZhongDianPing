//
//  DiscountAllTypeCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiscountAllTypeDelegate <NSObject>

-(void)typeClicked:(UIButton*) button;

@end

@interface DiscountAllTypeCell : UITableViewCell{
    
    
}
@property(nonatomic,strong) NSDictionary * buttonDict;



@property(nonatomic,weak)id<DiscountAllTypeDelegate> delegate;

@end
