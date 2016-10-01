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
        
      
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.userIcon];
        
        
        
        
    }
    
    return self;
}

-(void)setUserModel:(UserInfoModel *)userModel
{
    
    _userModel = userModel;
    
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:userModel.userIconUrl]];
    _userNameLabel.text = userModel.userName;
}

-(UILabel*)userNameLabel
{
    if (!_userNameLabel) {
        
        _userNameLabel = [UILabel new];
        _userNameLabel.text = @"点击登录";
        _userNameLabel.textColor = kWhiteColor;
        _userNameLabel.font =kBoldFont(15);
        _userNameLabel.frame = CGRectMake(CGRectGetMaxX(self.userIcon.frame) +30, 50, 100, 20);
    }
    
    return _userNameLabel;
}
-(UIImageView*)userIcon
{
    if (!_userIcon) {
        
        _userIcon = [UIImageView new];
        _userIcon.image = [UIImage imageNamed:@"userDefault"];
        _userIcon.frame = CGRectMake(50, 50, 50, 50);
        _userIcon.layer.masksToBounds = YES;
        _userIcon.layer.borderColor = kWhiteColor.CGColor;
        _userIcon.layer.borderWidth = 1;
        _userIcon.layer.cornerRadius = _userIcon.frame.size.width / 2;
    }
    
    return _userIcon;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


























