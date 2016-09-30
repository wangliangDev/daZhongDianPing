//
//  DiscountAllTypeCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountAllTypeCell.h"

@implementation DiscountAllTypeCell

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
    
      int buttonWidth = KSCREEN_WIDTH / 4;
    
    NSArray *contentArr = [buttonDict objectForKey:@"content"];
    NSString *title = [buttonDict objectForKey:@"title"];
    NSArray *smallArr = [contentArr subarrayWithRange:NSMakeRange(0, 11)];
    
  
    
    
}
-(void)setButtonArray:(NSArray *)buttonArray
{
    _buttonArray = buttonArray;
    
      int buttonWidth = KSCREEN_WIDTH / 4;
    
    for (int i = 0; i <[buttonArray count]; i++)
    {
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * (i%4), 30*(i/4), buttonWidth, 30);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        button.titleLabel.font = kFont(15);
        [button setTitleColor: kBlackColor forState:UIControlStateNormal];
        [button setTitle:buttonArray[i] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        
        
    }

    
}
-(void)typeAction:(UIButton*)button
{
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end










