//
//  DiscoverAskCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverAskModel.h"

@interface DiscoverAskCell : UITableViewCell{
    
    
}

@property(nonatomic,strong)UIImageView *line;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *flagTitleLabel;
@property(nonatomic,strong)UIImageView *headIcon;
@property(nonatomic,strong)UILabel *allAskLabel;
@property(nonatomic,strong)DiscoverAskModel *askModel;

@end
