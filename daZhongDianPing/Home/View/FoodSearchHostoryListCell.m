//
//  FoodSearchHostoryListCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/11.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "FoodSearchHostoryListCell.h"

@implementation FoodSearchHostoryListCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.line];
        
    }
    
    return self;
}

-(UILabel*)titleLabel
{
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(40, 10, 150, 24);
        _titleLabel.font = kFont(13);
        _titleLabel.textColor = kBlackColor;
    }
    
    return _titleLabel;
}

-(UILabel*)line
{
    
    if (!_line) {
        
        _line = [UILabel new];
        _line.frame = CGRectMake(0, 43, KSCREEN_WIDTH, 1);
        _line.backgroundColor = RGB(235, 235, 235);
    }
    
    return _line;
}

-(UIImageView*)iconImage
{
    if (!_iconImage) {
        
        _iconImage = [UIImageView new];
        _iconImage.frame = CGRectMake(10, 14, 16, 16);
        _iconImage.image = [UIImage imageNamed:@"scenicSearch"];
    }
    
    return _iconImage;
}
-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text = title;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
