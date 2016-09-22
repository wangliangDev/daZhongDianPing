//
//  popTableview.m
//  testxxxxxx
//
//  Created by jinns on 16/4/21.
//  Copyright © 2016年 jinns. All rights reserved.
//

#import "popTableview.h"

@implementation popTableview

-(id)initWithFrame:(CGRect)frame array:(NSArray *)array imageArray:(NSArray*)imageArray
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        titleArray = array;
        _imageArray = imageArray;
        PopTableView = [[UITableView alloc]initWithFrame:frame];
        PopTableView.delegate = self;
        PopTableView.dataSource = self;
        PopTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:PopTableView];
    }
    
    return  self;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(selectAtIndex:value:)])
    {
        [self.delegate selectAtIndex:indexPath.row value:[titleArray objectAtIndex:indexPath.row]];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return titleArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    lineLabel  = [[UILabel alloc]init];
    lineLabel.backgroundColor = RGB(240, 240, 240);
    [cell.contentView addSubview:lineLabel];
    
    
    
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(cell).offset(40);
        make.right.equalTo(cell);
        make.bottom.equalTo(cell).offset(0);
        make.height.equalTo(@1);
        
    }];
    
    titleLabel = [[UILabel alloc]init];
    titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    titleLabel.font = [UIFont systemFontOfSize:11];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:titleLabel];

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(cell);
        make.width.equalTo(@68);
        make.top.equalTo(cell).offset(10);
        make.bottom.equalTo(cell).offset(-10);
    }];
    
    iconImageView = [UIImageView new];
    iconImageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:iconImageView];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(cell).offset(10);
        make.centerY.equalTo(cell);
        make.width.height.equalTo(@20);
    }];
    
    return cell;
}

@end




















