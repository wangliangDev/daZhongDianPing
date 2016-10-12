//
//  DiscountFoodCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/12.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^foodActionBlock)(int buttonTag);
typedef void(^allFoodBlock)();


@interface DiscountFoodCell : UITableViewCell{
    
    
}
@property(nonatomic,strong)NSDictionary *buttonDict;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *allFoodButton;
@property(nonatomic,strong)foodActionBlock foodActionBlock;
@property(nonatomic,strong)allFoodBlock allFoodBlock;

@end
