//
//  DiscoverAskCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscoverAskCell.h"

@implementation DiscoverAskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:self.line];
    }
    
    return self;
}

-(UIImageView*)line
{
    if (!_line) {
        
        _line = [UIImageView new];
        _line.image = [UIImage imageNamed:@"Seperate_Line"];
        _line.frame = CGRectMake(0, 99, KSCREEN_WIDTH, 1);
    }
    
    return _line;
}

-(UILabel*)flagTitleLabel
{
    if (!_flagTitleLabel) {
        
        _flagTitleLabel = [UILabel new];
        _flagTitleLabel.font = kFont(10);
        _flagTitleLabel.textColor = kMagentaColor;
        _flagTitleLabel.frame = CGRectMake(35, 5, 60, 20);
        [self.contentView addSubview:_flagTitleLabel];
        
    }
    
    return _flagTitleLabel;
}

-(UILabel*)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        _titleLabel.font = kFont(13);
        _titleLabel.textColor = kBlackColor;
        _titleLabel.frame = CGRectMake(10, CGRectGetMaxY(self.flagTitleLabel.frame)+1, 200, 20);
        [self.contentView addSubview:_titleLabel];
        
    }
    
    return _titleLabel;
}
-(UILabel*)contentLabel
{
    if (!_contentLabel) {
        
        _contentLabel = [UILabel new];
        _contentLabel.font = kFont(11);
        _contentLabel.textColor = kDetailTextColor;
        _contentLabel.numberOfLines = 2;
        _contentLabel.frame = CGRectMake(40, CGRectGetMaxY(self.titleLabel.frame)+1, KSCREEN_WIDTH *0.8, 30);
        [self.contentView addSubview:_contentLabel];
        
    }
    
    return _contentLabel;
}
-(UILabel*)allAskLabel
{
    if (!_allAskLabel) {
        
        _allAskLabel = [UILabel new];
        _allAskLabel.font = kFont(11);
        _allAskLabel.textColor = kDetailTextColor;
        _allAskLabel.frame = CGRectMake(KSCREEN_WIDTH-60, CGRectGetMaxY(self.contentLabel.frame)+1,70 , 20);
        [self.contentView addSubview:_allAskLabel];
        
    }
    
    return _allAskLabel;
}

-(UIImageView*)headIcon
{
    if (!_headIcon) {
        
        _headIcon = [UIImageView new];
        _headIcon.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame)+1, 26, 26);
        _headIcon.layer.cornerRadius = 13;
        _headIcon.layer.masksToBounds = YES;
        [self.contentView addSubview:_headIcon];
        
    }
    
    return _headIcon;
}


-(void)setAskModel:(DiscoverAskModel *)askModel
{
    _askModel = askModel;
    
    self.titleLabel.text = askModel.title;
    self.contentLabel.text = askModel.content;
    self.flagTitleLabel.text = askModel.flagTitle;
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:askModel.headIconUrl] placeholderImage:[UIImage imageNamed:@""]];
    self.allAskLabel.text = [NSString stringWithFormat:@"%@个回答",askModel.askCount];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
