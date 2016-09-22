//
//  newDiscountCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/14.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^leftBlock)();
typedef void(^rightBlock)();

@interface newDiscountCell : UITableViewCell{
    
    
    UIButton *leftButton;
    UIButton *rightButton;
    
}
@property(nonatomic,strong)NSString *leftUrl;
@property(nonatomic,strong)NSString *rightUrl;
@property(nonatomic,strong)leftBlock leftBlock;
@property(nonatomic,strong)rightBlock rightBlock;

@end
