//
//  DiscountTypeCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountTypeCell.h"

@implementation DiscountTypeCell

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

-(void)setButtonArray:(NSArray *)buttonArray
{
    _buttonArray = buttonArray;
    int buttonWidth = KSCREEN_WIDTH / buttonArray.count;
    
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.hotLabel];
    [self.contentView addSubview:self.headLine];
    for (int i = 0; i <[buttonArray count]; i++)
    {
        NSDictionary *dict = buttonArray[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, 60);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.contentView addSubview:button];
        
        UIImageView *iconImageView = [UIImageView new];
        iconImageView.frame = CGRectMake(0, 10, 35, 35);
        [iconImageView setCenter:CGPointMake(buttonWidth / 2, 20)];
        iconImageView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
        [button addSubview:iconImageView];
        
        UILabel *titlelabel = [UILabel new];
        titlelabel.frame = CGRectMake(0, 10, 60, 20);
        titlelabel.font = kFont(11);
        titlelabel.textAlignment = NSTextAlignmentCenter;
        [titlelabel setCenter:CGPointMake(buttonWidth / 2, CGRectGetMaxY(iconImageView.frame) +13)];
        titlelabel.textColor = kBlackColor;
        titlelabel.text = [dict objectForKey:@"text"];
        [button addSubview:titlelabel];
        
    }
    
    
}

-(UILabel*)line
{
    if (!_line) {
        
        _line = [UILabel new];
        _line.frame = CGRectMake(0, 65, KSCREEN_WIDTH, 1);
        _line.backgroundColor = RGB(235, 235, 235);
    }
    
    return _line;
}

-(UILabel*)hotLabel
{
    if (!_hotLabel) {
        
        _hotLabel = [UILabel new];
        _hotLabel.frame = CGRectMake(10, 11+65, 70, 20);
        _hotLabel.font = [UIFont boldSystemFontOfSize:15];
        _hotLabel.text = @"热门优惠";
        _hotLabel.textColor = kBlackColor;
    }
    
    return _hotLabel;
}
-(SXHeadLine*)headLine
{
    
    if (!_headLine) {
        
        _headLine = [[SXHeadLine alloc]initWithFrame:CGRectMake(90, 11+65, KSCREEN_WIDTH-100, 20)];
        _headLine.messageArray = @[@"创意手工坊，人生意想不到 >",@"乐享美食，免费各地大餐 >",@"好吃又好玩，自己DIY >"];
        [_headLine setBgColor:kWhiteColor textColor:kOrangeColor textFont:kFont(13)];
        [_headLine setScrollDuration:0.5 stayDuration:3];
        [_headLine changeTapMarqueeAction:^(NSInteger index) {
            
            NSLog(@"%d",(int)index);
            if (_hotIndexSelectBlock) {
                
                _hotIndexSelectBlock((int)index);
            }
        }];
        [_headLine start];
    }
    
    return _headLine;
}

-(void)typeAction:(UIButton*)button{
    
    if (_typeActionBlock) {
        
        _typeActionBlock((int)button.tag);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end













