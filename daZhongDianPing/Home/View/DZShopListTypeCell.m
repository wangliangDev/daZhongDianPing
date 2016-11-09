//
//  DZShopListTypeCell.m
//  daZhongDianPing
//
//  Created by apple on 2016/11/9.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DZShopListTypeCell.h"
#import "TTBBImageTextSortButton.h"

@implementation DZShopListTypeCell

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

-(void)setTypeButtonArray:(NSArray *)typeButtonArray
{
    _typeButtonArray = typeButtonArray;
    
    int buttonWidth = KSCREEN_WIDTH / 4;
    
    [typeButtonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        TTBBImageTextSortButton *button = [TTBBImageTextSortButton buttonWithType:UIButtonTypeCustom];
        button.buttonStyle = buttonStyleImageUpTextDwon;
        button.frame = CGRectMake(buttonWidth * (idx % 4), buttonWidth * (idx / 4), buttonWidth, buttonWidth);
        [button setImage:[UIImage imageNamed:[obj objectForKey:@"image"]] forState:UIControlStateNormal];
        [button setTitle:[obj objectForKey:@"title"] forState:UIControlStateNormal];
        button.titleLabel.font = kFont(11);
        [button setImageSize:CGSizeMake(40, 40)];
        [button setTitleColor:kBlackColor forState:UIControlStateNormal];
        button.tag = idx;
       
        [button addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
        
        
    }];
}

-(void)typeAction:(UIButton*)button
{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end




