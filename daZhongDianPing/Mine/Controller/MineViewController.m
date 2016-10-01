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
#import "UserInfoManager.h"
#import "DZLoginViewController.h"
#import "MineTypeButtonCell.h"
#import "DZUserInfoViewController.h"

#define USERINFOCELL @"UserInfoCell"
#define NORMALCELL @"normalCell"
#define TYPEBUTTONCELL @"MineTypeButtonCell"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *_tableView;
    
   
    
    NSArray *section3;
    NSArray *section4;
    NSArray *section5;
    NSArray *dataArray;
    NSArray *dataArray2;
}



@end

@implementation MineViewController



-(void)viewDidLoad
{
    
    self.view.backgroundColor = kWhiteColor;
   
    
    [self initObject];
    [self createTableView];
}
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)initObject{
    
     section3 = @[@"我的团购券",@"我的卡券",@"我的钱包",@"我的积分"];
     section4 = @[@"待点评",@"最近浏览",@"联系客服",@"设置"];
     section5 = @[@"我是商家"];
    
     dataArray = @[@{@"icon": @"CategoryIconID4", @"text":@"我的点评", @"color": kWhiteColor,@"tag":@"101"},
                   @{@"icon": @"CategoryIconID5", @"text": @"我的收藏", @"color": kWhiteColor,@"tag":@"102"},
                   @{@"icon": @"CategoryIconID6", @"text": @"我的好友", @"color": kWhiteColor,@"tag":@"103"}];
    
    dataArray2 = @[@{@"icon": @"CategoryIconID1", @"text":@"待付款", @"color": kBlackColor,@"tag":@"104"},
                  @{@"icon": @"CategoryIconID2", @"text": @"可使用", @"color": kBlackColor,@"tag":@"105"},
                  @{@"icon": @"CategoryIconID3", @"text": @"退款/售后", @"color": kBlackColor,@"tag":@"106"}];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTableView) name:@"reloadTableView" object:nil];
    
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
    [_tableView registerClass:[MineTypeButtonCell class] forCellReuseIdentifier:TYPEBUTTONCELL];
    [self.view addSubview:_tableView];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
    
}
-(void)reloadTableView
{
    [_tableView reloadData];
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
        
        return 110;
        
    }else if (indexPath.section == 1)
    {
        
        if (indexPath.row == 0 || indexPath.row == 2)
        {
            
            return 60;
        }
        
    }
    
    return 44;
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
        
        UserInfoCell *Cell = [[UserInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:USERINFOCELL];
        
        if ([UserInfoManager shardManager].isLogin) {
            
            Cell.userModel = [[UserInfoManager shardManager]getUserInfo];
            
        }
        
        theCell = Cell;
        
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
           
            MineTypeButtonCell *cell = [[MineTypeButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TYPEBUTTONCELL];
            cell.backgroundColor = RGB(149, 107, 39);
            cell.buttonArray = dataArray;
            cell.typeBlock = ^(int tag){
                
                
                NSLog(@"%d",tag);
                
            };
            theCell = cell;
            
        }else if (indexPath.row == 1) {
            
            normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.title = @"我的订单";
            
            theCell = cell;
            
        }else{
           
            
            MineTypeButtonCell *cell = [[MineTypeButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TYPEBUTTONCELL];
            cell.backgroundColor = kWhiteColor;
            cell.buttonArray = dataArray2;
            cell.typeBlock = ^(int tag){
                
               
                NSLog(@"%d",tag);
                
            };
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
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return theCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if ([UserInfoManager shardManager].isLogin) {
        
        if (indexPath.section == 0) {
            
            DZUserInfoViewController *userinfo = [[DZUserInfoViewController alloc]init];;
            [userinfo setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:userinfo animated:YES];
            
        }
        
        
    }else{
        
        DZLoginViewController *loginViewcontrol = [[DZLoginViewController alloc]init];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginViewcontrol];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [self presentViewController:nav animated:YES completion:nil];
            
            
        });

    }
    
}
-(void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end





























