//
//  DiscountAllTypeHeadCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiscountAllTypeHeadDelegate <NSObject>

-(void)typeClicked:(UIButton *)button;

@end

@interface DiscountAllTypeHeadCell : UITableViewCell


@property(nonatomic,strong)NSDictionary *buttonDict;
@property(nonatomic,weak)id<DiscountAllTypeHeadDelegate> delegate;

@end
