//
//  DiscountAllTypeHeadCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountAllTypeHeadCell.h"

@implementation DiscountAllTypeHeadCell

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
    
    NSArray *buttonArray = [buttonDict objectForKey:@"content"];
    int buttonWidth = (KSCREEN_WIDTH - 10) / buttonArray.count;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = kWhiteColor;
    bgView.layer.borderWidth=1;
    bgView.layer.borderColor =RGB(235, 235, 235).CGColor;
    bgView.frame = CGRectMake(5, 10, KSCREEN_WIDTH - 10, 100);
    [self.contentView addSubview:bgView];
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(10, 10, 20, 20);
    imageView.image = [UIImage imageNamed:[buttonDict objectForKey:@"icon"]];
    [bgView addSubview:imageView];
    
    UILabel *line = [UILabel new];
    line.backgroundColor = RGB(235, 235, 235);
    line.frame = CGRectMake(0, 39, KSCREEN_WIDTH - 10, 1);
    [bgView addSubview:line];
    
    
    UILabel *label = [UILabel new];
    label.font = kFont(12);
    label.text = [buttonDict objectForKey:@"title"];
    label.textColor = kBlackColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+5, 10, 50, 20);
    [bgView addSubview:label];
    
    
    for (int i = 0; i <[buttonArray count]; i++)
    {
        NSDictionary *dict = buttonArray[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * i, 40, buttonWidth, 50);
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [bgView addSubview:button];
       
        UIImageView *iconImageView = [UIImageView new];
        iconImageView.frame = CGRectMake(0, 0, 30, 30);
        [iconImageView setCenter:CGPointMake(buttonWidth / 2, 20)];
        iconImageView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
        [button addSubview:iconImageView];
        
        UILabel *titlelabel = [UILabel new];
        titlelabel.frame = CGRectMake(0, 10, 60, 20);
        titlelabel.font = kFont(10);
        titlelabel.textAlignment = NSTextAlignmentCenter;
        [titlelabel setCenter:CGPointMake(buttonWidth / 2, CGRectGetMaxY(iconImageView.frame) +12)];
        titlelabel.textColor = kBlackColor;
        titlelabel.text = [dict objectForKey:@"text"];
        [button addSubview:titlelabel];
        
    }
    
    
    
    
}

-(void)typeAction:(UIButton*)button{
    
    if ([_delegate respondsToSelector:@selector(typeClicked:)]) {
        
        [_delegate typeClicked:button];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
