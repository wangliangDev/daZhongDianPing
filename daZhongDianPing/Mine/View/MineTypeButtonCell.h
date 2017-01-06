//
//  MineTypeButtonCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/26.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^typeBlock)(int buttonTag);

@interface MineTypeButtonCell : UITableViewCell{
    
    
    
    
    
}
@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *middleButton;
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)NSArray *buttonArray;
@property(nonatomic,copy)typeBlock typeBlock;

@end
