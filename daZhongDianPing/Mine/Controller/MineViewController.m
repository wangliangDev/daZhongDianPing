//
//  MineViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "MineViewController.h"
#import "UserInfoCell.h"
#import "normalCell.h"

#define USERINFOCELL @"UserInfoCell"
#define NORMALCELL @"normalCell"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *_tableView;
    
   
    
    NSArray *section3;
    NSArray *section4;
    NSArray *section5;
}



@end

@implementation MineViewController



-(void)viewDidLoad
{
    
    self.view.backgroundColor = kWhiteColor;
    [self.navigationController setNavigationBarHidden:YES];
    
    [self initObject];
    [self createTableView];
}

-(void)initObject{
    
     section3 = @[@"我的团购券",@"我的卡券",@"我的钱包",@"我的积分"];
     section4 = @[@"待点评",@"最近浏览",@"联系客服",@"设置"];
     section5 = @[@"我是商家"];
    
    
    
}
-(void)createTableView
{
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setShowsVerticalScrollIndicator:NO];
    [_tableView registerClass:[UserInfoCell class] forCellReuseIdentifier:USERINFOCELL];
    [_tableView registerClass:[normalCell class] forCellReuseIdentifier:NORMALCELL];
//    [HomeTableView registerClass:[homeLikeListCell class] forCellReuseIdentifier:HOMELIKELISTCELL];
    [self.view addSubview:_tableView];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        
        return 3;
        
    }else if (section == 2) {
        
        return section3.count;
        
    }else if (section == 3){
        
        return section4.count;
        
    }else if (section == 4){
        
        return section5.count;
        
    }else{
        
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 150;
        
    }else{
        
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 ) {
        
        return 0;
        
    }else{
        
        return 10;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCell = nil;
    
    if (indexPath.section == 0) {
        
        UserInfoCell *userInfoCell = [[UserInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:USERINFOCELL];
        theCell = userInfoCell;
        
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 1) {
            
            normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.title = @"我的订单";
            theCell = cell;
            
        }else{
           
            
            normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
            cell.title = @"我的订单";
            theCell = cell;

        }
        
      
        
    }else if (indexPath.section == 2){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.title = [section3 objectAtIndex:indexPath.row];
        
        if (indexPath.row == 1) {
            
            cell.disc = @"抵用券/再多券";
        }else if (indexPath.row == 3){
            
            cell.disc = @"小任务 大积分";
        }
        
        theCell = cell;
        
    }else if (indexPath.section == 3){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         cell.title = [section4 objectAtIndex:indexPath.row];
        theCell = cell;

    }else if (indexPath.section == 4){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         cell.title = [section5 objectAtIndex:indexPath.row];
        theCell = cell;
        
    }
    
    return theCell;
    
}

@end





























