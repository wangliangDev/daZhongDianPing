//
//  FoodSearchHeadCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/11.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "FoodSearchHeadCell.h"

@implementation FoodSearchHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = RGB(235, 235, 235);
    }
    
    return self;
}

-(void)setButtonArray:(NSArray *)buttonArray
{
    _buttonArray = buttonArray;
    
     int buttonWidth = (KSCREEN_WIDTH - 20) / 3;
    
    for (int i = 0; i <[buttonArray count]; i++)
    {
       
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+buttonWidth * (i%3), 10+35*(i/3), buttonWidth, 35);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[buttonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.backgroundColor = kWhiteColor;
        [button setTitleColor:kBlackColor forState:UIControlStateNormal];
        button.titleLabel.font = kFont(13);
        button.tag = i;
        [self.contentView addSubview:button];
        
        UILabel *verticalLabel = [UILabel new];
        verticalLabel.frame = CGRectMake(buttonWidth-1, 0, 1, 35);
        verticalLabel.backgroundColor = RGB(190, 190, 190);
        [button addSubview:verticalLabel];
        
        UILabel *horizontalLabel = [UILabel new];
        horizontalLabel.frame = CGRectMake(0, 34, buttonWidth, 1);
        horizontalLabel.backgroundColor = RGB(190, 190, 190);
        [button addSubview:horizontalLabel];
        
        if ((i+1) %3 ==0)
        {
            [verticalLabel setHidden:YES];
        }
        if ((i+1) > 6) {
           
            [horizontalLabel setHidden:YES];
        }
        
    }
}

-(void)typeAction:(UIButton*)button
{
    
    if (_searchTypeBlock) {
        
        _searchTypeBlock(button);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end













