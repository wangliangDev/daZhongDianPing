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
    
    for (int i = 0; i <[buttonArray count]; i++)
    {
        NSDictionary *dict = buttonArray[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, 60);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.contentView addSubview:button];
        
        UIImageView *iconImageView = [UIImageView new];
        iconImageView.frame = CGRectMake(0, 10, 40, 40);
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













