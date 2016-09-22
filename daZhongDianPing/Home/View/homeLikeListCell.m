//
//  homeLikeListCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/18.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "homeLikeListCell.h"

@implementation homeLikeListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        
         iconImage  = [UIImageView new];
        [self.contentView addSubview:iconImage];
        
        [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(@80);
            
        }];
        
        
        titleLabel = [UILabel new];
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconImage.mas_right).offset(10);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-50);
        }];
        
        distanceLabel = [UILabel new];
        distanceLabel.font = [UIFont systemFontOfSize:11];
        distanceLabel.textColor = RGB(155, 155, 155);
        [self.contentView addSubview:distanceLabel];
        
        [distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(titleLabel.mas_right).offset(5);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-5);
        }];
        
        descLabel = [UILabel new];
        descLabel.font = [UIFont systemFontOfSize:11];
        descLabel.numberOfLines = 2;
        descLabel.textColor = RGB(155, 155, 155);
        [self.contentView addSubview:descLabel];
        
        [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconImage.mas_right).offset(10);
            make.top.equalTo(titleLabel.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-5);
        }];

        PriceLabel = [UILabel new];
        PriceLabel.font = [UIFont boldSystemFontOfSize:15];
        PriceLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:PriceLabel];
        
        [PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconImage.mas_right).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(@55);
        }];

        sellLabel = [UILabel new];
        sellLabel.font = [UIFont systemFontOfSize:11];
        sellLabel.textColor = RGB(155, 155, 155);
        [self.contentView addSubview:sellLabel];
        
        [sellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-5);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(@50);
        }];
        
        
        line = [UILabel new];
        line.backgroundColor = RGB(235, 235, 235);
        [self.contentView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@1);
        }];

    }
    
    return self;
}

-(void)setLikeModel:(homeLikeListModel *)likeModel
{
    
    _likeModel = likeModel;
    
    [iconImage sd_setImageWithURL:[NSURL URLWithString:likeModel.iconImageUrl] placeholderImage:[UIImage imageNamed:@"1.png"]];
    titleLabel.text = likeModel.title;
    distanceLabel.text = likeModel.distance;
    descLabel.text = likeModel.desc;
    PriceLabel.text = likeModel.price;
    sellLabel.text = likeModel.sell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end










