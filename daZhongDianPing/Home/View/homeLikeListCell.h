//
//  homeLikeListCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/18.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeLikeListModel.h"

@interface homeLikeListCell : UITableViewCell{
    
    
    UILabel *titleLabel;
    UILabel *descLabel;
    UILabel *distanceLabel;
    UILabel *PriceLabel;
    UILabel *oldPriceLabel;
    UILabel *sellLabel;
    UIImageView *iconImage;
   
    UILabel *line;
    
}
@property(nonatomic,strong)homeLikeListModel * likeModel;

@end
