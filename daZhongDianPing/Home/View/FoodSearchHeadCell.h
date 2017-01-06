//
//  FoodSearchHeadCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/11.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^searchType)(UIButton *button);

@interface FoodSearchHeadCell : UITableViewCell{
    
    
}

@property(nonatomic,strong)NSArray *buttonArray;
@property(nonatomic,copy)searchType searchTypeBlock;
@end
