//
//  DiscountFoodCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/12.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountFoodCell.h"
#import "DiscountFoodModel.h"
#define SPACEING 25

@implementation DiscountFoodCell

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

-(void)setButtonDict:(NSDictionary *)buttonDict
{
    
    _buttonDict = buttonDict;
    self.titleLabel.text = [buttonDict objectForKey:@"title"];
    [self.contentView addSubview:self.titleLabel];
    
    
    NSArray *array = [buttonDict objectForKey:@"button"];
    
    int buttonWidth = (KSCREEN_WIDTH - SPACEING *4) / array.count;
    
    [self.allFoodButton setTitle:[NSString stringWithFormat:@"全部%@个美味专题 >",[buttonDict objectForKey:@"allCount"]] forState:UIControlStateNormal];
    [self.contentView addSubview:self.allFoodButton];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DiscountFoodModel *model = obj;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SPACEING+ (buttonWidth+SPACEING) *idx  , 35, buttonWidth, 120);
        button.backgroundColor = kOrangeColor;
        button.tag = idx;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.imageUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:button];
        
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(5, -5, 35, 35);
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.smallImageUrl] placeholderImage:[UIImage imageNamed:@""]];
        [button addSubview:imageView];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(buttonWidth*0.1, 120-25, buttonWidth*0.8, 16);
        label.text = model.content;
        label.backgroundColor = kBrownColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = kFont(11);
        label.textColor = kWhiteColor;
        [button addSubview:label];
        
        UILabel *hotlabel = [UILabel new];
        hotlabel.frame = CGRectMake(SPACEING+ (buttonWidth+SPACEING) *idx, CGRectGetMaxY(button.frame)+10, buttonWidth, 16);
        hotlabel.text = [NSString stringWithFormat:@"%@万人气",model.hot];
        hotlabel.textAlignment = NSTextAlignmentCenter;
        hotlabel.font = kFont(11);
        hotlabel.textColor = kBrownColor;
        [self.contentView addSubview:hotlabel];
       
        
    }];
    
    
}

-(UILabel*)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        _titleLabel.font = kFont(15);
        _titleLabel.textColor = kOrangeColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.frame = CGRectMake(KSCREEN_WIDTH *0.2 , 5, KSCREEN_WIDTH*0.6, 20);
    }
    
    return _titleLabel;
}

-(UIButton*)allFoodButton
{
    if (!_allFoodButton) {
        
        _allFoodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _allFoodButton.frame = CGRectMake(KSCREEN_WIDTH*0.3, 200, KSCREEN_WIDTH*0.4, 25);
        _allFoodButton.layer.borderColor = kGrayColor.CGColor;
        _allFoodButton.layer.borderWidth = 0.5;
        _allFoodButton.titleLabel.font = kFont(12);
        [_allFoodButton addTarget:self action:@selector(allFoodAction:) forControlEvents:UIControlEventTouchUpInside];
        [_allFoodButton setTitleColor:kBlackColor forState:UIControlStateNormal];
        
    }
    
    return _allFoodButton;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)buttonAction:(UIButton*)button{
    
    if (_foodActionBlock) {
        
        _foodActionBlock((int)button.tag);
    }
}

-(void)allFoodAction:(UIButton*)button
{
    if (_allFoodBlock) {
        
        _allFoodBlock();
    }
}
@end











