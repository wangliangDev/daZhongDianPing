//
//  FindGoodShopCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "FindGoodShopCell.h"

#define spaceing 20

@implementation FindGoodShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
    }
    
    return self;
}

-(void)setContentDict:(NSDictionary *)contentDict
{
    
    _contentDict = contentDict;
    
    self.titleLabel.text = [contentDict objectForKey:@"title"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleTap:)];
    [self.titleLabel addGestureRecognizer:tap];
    [self.contentView addSubview:self.titleLabel];
    
    
    NSArray *array = [contentDict objectForKey:@"contentArray"];
    
    int buttonWidth = (KSCREEN_WIDTH - spaceing * 3) / array.count;
    
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(spaceing+ (buttonWidth+spaceing) *idx, 40, buttonWidth, buttonWidth-30);
        button.tag = idx;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = RGB(235, 235, 235).CGColor;
        [self.contentView addSubview:button];
        
        
        UIImageView *imageView =[UIImageView new];
        imageView.frame = CGRectMake(0, 0, buttonWidth, buttonWidth*0.5);
        [imageView sd_setImageWithURL:[NSURL URLWithString:[obj objectForKey:@"imageUrl"]] placeholderImage:[UIImage imageNamed:@""]];
        [button addSubview:imageView];
        
        UILabel *smallLabel = [UILabel new];
        smallLabel.font = kFont(11);
        smallLabel.textColor = kBlackColor;
        smallLabel.text = [obj objectForKey:@"smallTitle"];
        smallLabel.frame = CGRectMake(buttonWidth * 0.1, CGRectGetMaxY(imageView.frame)+5, KSCREEN_WIDTH * 0.8, 20);
        [button addSubview:smallLabel];
        
        
        UILabel *discLabel = [UILabel new];
        discLabel.font = kFont(10);
        discLabel.textColor = RGB(95, 95, 95);
        discLabel.text = [obj objectForKey:@"discription"];
        discLabel.frame = CGRectMake(buttonWidth * 0.1, CGRectGetMaxY(smallLabel.frame), KSCREEN_WIDTH * 0.8, 20);
        [button addSubview:discLabel];
        
    }];
    
}

-(UILabel*)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = kBlackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.frame = CGRectMake(KSCREEN_WIDTH * 0.3, 10, KSCREEN_WIDTH * 0.4, 20);
    }
    
    return _titleLabel;
}

-(void)titleTap:(UITapGestureRecognizer*)tapGes
{
    if (_allGoodShopBlock) {
        
        _allGoodShopBlock();
    }
    
}


-(void)buttonAction:(UIButton*)button{
    
    if (_typeActionBlock) {
        
        _typeActionBlock(button);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end







