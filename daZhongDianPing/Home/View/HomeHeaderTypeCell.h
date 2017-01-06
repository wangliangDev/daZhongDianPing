//
//  HomeHeaderTypeCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/8/5.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^typeSelect)(UIButton*button);
@interface HomeHeaderTypeCell : UITableViewCell{
    
    
    
    
}

@property(nonatomic,strong)NSDictionary *buttonDict;
@property(nonatomic,copy)typeSelect typeSelectBlock;
@end
