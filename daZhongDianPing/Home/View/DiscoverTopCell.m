//
//  DiscoverTopCell.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscoverTopCell.h"

@implementation DiscoverTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:self.line];
    }
    
    return self;
}

-(void)setTopModel:(DiscoverTopMocel *)topModel
{
    _topModel = topModel;
    
    int flag = topModel.flag;
    
    if (flag == 0) {
        
        self.flagImageView.image = [UIImage imageNamed:@"found_listtitle_0_70x24_"];
        
    }else if (flag == 1){
        
         self.flagImageView.image = [UIImage imageNamed:@"found_listtitle_1_70x24_"];
        
    }else if (flag == 2){
        
         self.flagImageView.image = [UIImage imageNamed:@"found_listtitle_2_70x24_"];
    }
    
    self.titleLabel.text = topModel.title;
    self.contentLabel.text = topModel.content;
    [self.FoodImageView sd_setImageWithURL:[NSURL URLWithString:topModel.imageUrl] placeholderImage:[UIImage imageNamed:@""]];
    self.flagTitleLabel.text = topModel.flagTitle;
    self.hotLabel.text = [NSString stringWithFormat:@"%d",topModel.hotCount];
}


-(UIImageView*)flagImageView
{
    if (!_flagImageView) {
        
        _flagImageView = [UIImageView new];
        _flagImageView.frame = CGRectMake(0, 7, 50, 20);
        [self.contentView addSubview:_flagImageView];
        
    }
    
    return _flagImageView;
}

-(UIImageView*)FoodImageView
{
    if (!_FoodImageView) {
        
        _FoodImageView = [UIImageView new];
        _FoodImageView.frame = CGRectMake(KSCREEN_WIDTH-70, 10, 60, 60);
        [self.contentView addSubview:_FoodImageView];
        
    }
    
    return _FoodImageView;
}

-(UILabel*)flagTitleLabel
{
    if (!_flagTitleLabel) {
        
        _flagTitleLabel = [UILabel new];
        _flagTitleLabel.font = kFont(10);
        _flagTitleLabel.textColor = kWhiteColor;
        _flagTitleLabel.textAlignment = NSTextAlignmentCenter;
        _flagTitleLabel.frame = CGRectMake(0, 0, 50, 20);
        [self.flagImageView addSubview:_flagTitleLabel];
        
    }
    
    return _flagTitleLabel;
}


-(UILabel*)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        _titleLabel.font = kBoldFont(13);
        _titleLabel.textColor = kBlackColor;
        _titleLabel.frame = CGRectMake(CGRectGetMaxX(self.flagImageView.frame)+5, 7, 160, 20);
        [self.contentView addSubview:_titleLabel];
        
    }
    
    return _titleLabel;
}

-(UILabel*)contentLabel
{
    if (!_contentLabel) {
        
        _contentLabel = [UILabel new];
        _contentLabel.font = kFont(11);
        _contentLabel.textColor = kDetailTextColor;
        _contentLabel.frame = CGRectMake(10, CGRectGetMaxY(self.flagImageView.frame)+5, KSCREEN_WIDTH *0.65, 20);
        [self.contentView addSubview:_contentLabel];
        
    }
    
    return _contentLabel;
}

-(UILabel*)hotLabel
{
    if (!_hotLabel) {
        
        _hotLabel = [UILabel new];
        _hotLabel.font = kFont(11);
        _hotLabel.textColor = kDetailTextColor;
        _hotLabel.frame = CGRectMake(10, CGRectGetMaxY(self.contentLabel.frame)+2, 100, 20);
        [self.contentView addSubview:_hotLabel];
        
    }
    
    return _hotLabel;
}

-(UIImageView*)line
{
    if (!_line) {
        
        _line = [UIImageView new];
        _line.image = [UIImage imageNamed:@"Seperate_Line"];
        _line.frame = CGRectMake(0, 79, KSCREEN_WIDTH, 1);
    }
    
    return _line;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
