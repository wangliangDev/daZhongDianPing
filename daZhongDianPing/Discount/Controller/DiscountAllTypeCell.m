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
        
        self.backgroundColor = RGB(245, 245, 245);
        
       
        
    }
    
    return self;
}


-(void)setButtonDict:(NSDictionary *)buttonDict
{
    _buttonDict = buttonDict;
    
    NSArray * buttonArray = [buttonDict objectForKey:@"buttonArray"];
    
    
    
    int buttonWidth = (KSCREEN_WIDTH - 10) / 4;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = kWhiteColor;
    bgView.layer.borderWidth=1;
    bgView.layer.borderColor =RGB(235, 235, 235).CGColor;
    [self.contentView addSubview:bgView];
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(10, 10, 20, 20);
    imageView.image = [UIImage imageNamed:[buttonDict objectForKey:@"icon"]];
    [bgView addSubview:imageView];
    
    
    UILabel *label = [UILabel new];
    label.font = kFont(12);
    label.text = [buttonDict objectForKey:@"title"];
    label.textColor = kBlackColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+5, 10, 50, 20);
    [bgView addSubview:label];
    
    
    if (buttonArray.count %4 == 0) {
        
        bgView.frame = CGRectMake(5, 5, KSCREEN_WIDTH - 10, buttonArray.count / 4 *35+40);
        
    }else{
        
         bgView.frame = CGRectMake(5, 5, KSCREEN_WIDTH - 10, (buttonArray.count / 4 +1) *35+40);
    }
    
    
    for (int i = 0; i <[buttonArray count]; i++)
    {
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * (i%4), 40+35*(i/4), buttonWidth, 35);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        button.titleLabel.font = kFont(12);
        [button setTitleColor: kBlackColor forState:UIControlStateNormal];
        [button setTitle:buttonArray[i] forState:UIControlStateNormal];
        [bgView addSubview:button];
        
        button.layer.borderWidth = 1;
        button.layer.borderColor = RGB(235, 235, 235).CGColor;
        
    }

}


-(void)typeAction:(UIButton*)button
{
    
    if ([_delegate respondsToSelector:@selector(typeClicked:)]) {
        
        [_delegate typeClicked:button];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end










