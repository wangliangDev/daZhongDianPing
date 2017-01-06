//
//  SelectCityCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/27.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>
 typedef void(^citySelectBlock)(NSString *cityName);

@interface SelectCityCell : UITableViewCell{
    
    
}

@property(nonatomic,strong)NSArray *buttonArray;
@property(nonatomic,copy)citySelectBlock citySelectBlock;

@end
