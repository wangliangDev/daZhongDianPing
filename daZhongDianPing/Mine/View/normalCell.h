//
//  normalCell.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/22.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface normalCell : UITableViewCell{
    
    
    
}
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *discriptionLabel;
@property(nonatomic,weak)UILabel *lineLabel;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *disc;
@end
