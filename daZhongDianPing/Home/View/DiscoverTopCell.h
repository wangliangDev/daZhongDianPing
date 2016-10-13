//
//  DiscoverTopCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverTopMocel.h"


@interface DiscoverTopCell : UITableViewCell{
    
   
    
}

@property(nonatomic,strong)DiscoverTopMocel *topModel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *flagImageView;
@property(nonatomic,strong)UILabel *flagTitleLabel;
@property(nonatomic,strong)UIImageView *line;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *FoodImageView;
@property(nonatomic,strong)UILabel *hotLabel;
@end
