//
//  UserInfoCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/22.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "UserInfoCell.h"

@implementation UserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = RGB(194, 150, 81);
        
        userIcon = [UIImageView new];
        userIcon.image = [UIImage imageNamed:@"1.png"];
        [self.contentView addSubview:userIcon];
        
        [userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(50);
            make.top.equalTo(self).offset(50);
            make.width.height.equalTo(@50);
        }];
        
        userIcon.layer.masksToBounds = YES;
        userIcon.layer.cornerRadius = userIcon.frame.size.width / 2;
    }
    
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


























