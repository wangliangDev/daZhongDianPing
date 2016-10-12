//
//  TTBBCitySearchResultController.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/29.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBCitySearchResultController.h"

@interface TTBBCitySearchResultController ()

@end

@implementation TTBBCitySearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

-(UITableView*)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT-104) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
}

#pragma mark --UITableViewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.font = kFont(13);
    cell.textLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (_didSelectRowAtIndexPathBlock) {
        
        
        _didSelectRowAtIndexPathBlock([_dataArray objectAtIndex:indexPath.row]);
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_scrollViewDidScrollBlock) {
        
        _scrollViewDidScrollBlock();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end













