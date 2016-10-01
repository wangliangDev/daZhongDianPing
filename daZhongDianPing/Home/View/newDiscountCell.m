//
//  newDiscountCell.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/14.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "newDiscountCell.h"
#import <SDWebImage/UIButton+WebCache.h>

@implementation newDiscountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = RGB(205, 205, 205);
        [self initButton];
    }
    
    return self;
}


-(void)initButton
{
    
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 10, KSCREEN_WIDTH/2, 80);
    [self.contentView addSubview:leftButton];
    leftButton.backgroundColor = [UIColor orangeColor];
    leftButton.tag = 1;
    [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake( KSCREEN_WIDTH/2, 10, KSCREEN_WIDTH/2, 80);
    rightButton.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:rightButton];
     [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.tag = 2;
    
    [rightButton sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://i2.buimg.com/570557/4c1f4d982e790a86.png"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"4.png"]];
    
   
}

-(void)setRightUrl:(NSString *)rightUrl
{
    _rightUrl = rightUrl;
    [rightButton sd_setBackgroundImageWithURL:[NSURL URLWithString:rightUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"4.png"]];
}
-(void)setLeftUrl:(NSString *)leftUrl
{
    _leftUrl = leftUrl;
    [leftButton sd_setBackgroundImageWithURL:[NSURL URLWithString:leftUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"4.png"]];
}


-(void)buttonAction:(UIButton*)button
{
    if (button.tag == 1) {
        
        if (_leftBlock) {
            
            _leftBlock();
        }
        
    }else{
        
        
        if (_rightBlock) {
            
            _rightBlock();
        }
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    

}

@end








