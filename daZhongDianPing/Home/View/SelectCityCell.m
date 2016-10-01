//
//  SelectCityCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/27.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "SelectCityCell.h"

@implementation SelectCityCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    
    return self;
}

-(void)setButtonArray:(NSArray *)buttonArray
{
    int BUTTONWIDTH = 50;
    
    _buttonArray = buttonArray;
 
    int leftSpace = (KSCREEN_WIDTH-10 - BUTTONWIDTH * 5) / 10;
    
    [buttonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(leftSpace +(2*leftSpace + BUTTONWIDTH)* (idx %5), 10+(2*10 + 30)* (idx/5), BUTTONWIDTH, 30);
        [self.contentView addSubview:button];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:obj forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
        button.tag = idx;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
}

-(void)buttonAction:(UIButton*)button
{
    if (self.citySelectBlock) {
        
        self.citySelectBlock(button.titleLabel.text);
    }
}

@end




















