//
//  DiscountTypeCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXHeadLine.h"


typedef void(^typeActionBlock)(int buttonTag);
typedef void(^hotIndexSelectBlock)(int index);

@interface DiscountTypeCell : UITableViewCell{
    
}

@property(nonatomic,strong)NSArray *buttonArray;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)UILabel *hotLabel;
@property(nonatomic,strong)SXHeadLine *headLine;

@property(nonatomic,strong)typeActionBlock typeActionBlock;
@property(nonatomic,strong)hotIndexSelectBlock hotIndexSelectBlock;
@end
