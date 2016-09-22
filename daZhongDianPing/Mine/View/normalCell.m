//
//  normalCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/22.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "normalCell.h"

@implementation normalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createLineLabel];
    }
    
    return self;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

-(void)createLineLabel
{
    if (!_lineLabel)
    {
        UILabel *lineLabel = [UILabel new];
        [self.contentView addSubview:lineLabel];
        _lineLabel = lineLabel;
        
        _lineLabel.backgroundColor = RGB(246, 246, 246);
        
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@1);
            
        }];
        
    }
    
}
-(void)setDisc:(NSString *)disc
{
    _disc = disc;
    
    self.discriptionLabel.text = disc;
    
}
-(UILabel*)titleLabel
{
    if (!_titleLabel)
    {
        UILabel *titleLabel = [UILabel new];
        [self.contentView addSubview:titleLabel];
        
        _titleLabel = titleLabel;
        _titleLabel.font = kFont(13);
        _titleLabel.textColor = RGB(105, 105, 105);
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(@70);
            
        }];
    }
    
    return _titleLabel;
    
}
-(UILabel *)discriptionLabel
{
    
    if (!_discriptionLabel) {
        
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        _discriptionLabel = label;
        
       _discriptionLabel.textColor = RGB(190, 190, 190);
        _discriptionLabel.font = kFont(12);
        
        [_discriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-30);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(@85);
            
        }];
        
    }
    
    return _discriptionLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end












