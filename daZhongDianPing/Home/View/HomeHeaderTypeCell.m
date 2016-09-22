//
//  HomeHeaderTypeCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/5.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "HomeHeaderTypeCell.h"
#import "TTBBScrollViewButton.h"








@implementation HomeHeaderTypeCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
      
    
    }
    
    
    return self;
}

-(void)setButtonDict:(NSDictionary *)buttonDict
{
    
    _buttonDict = buttonDict;
    
    TTBBScrollViewButton *ttbbs = [[TTBBScrollViewButton alloc]init];
    ttbbs.frame = CGRectMake(0, 0, KSCREEN_WIDTH, 180);
    ttbbs.buttonDict = buttonDict;
    [self.contentView addSubview:ttbbs];
    
}


@end

















