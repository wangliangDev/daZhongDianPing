//
//  DiscountTypeCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^typeActionBlock)(int buttonTag);
@interface DiscountTypeCell : UITableViewCell{
    
}

@property(nonatomic,strong)NSArray *buttonArray;

@property(nonatomic,strong)typeActionBlock typeActionBlock;
@end
