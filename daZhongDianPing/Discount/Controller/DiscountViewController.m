//
//  DiscountViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountViewController.h"
#import "DiscountTypeCell.h"
#import "DiscountAllTypeController.h"


#define DISCOUNTTYPECELL @"DiscountTypeCell"

@interface DiscountViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *dataArray;
    
}
@property(nonatomic,strong)UITableView *tableview;



@end

@implementation DiscountViewController


-(void)viewDidLoad
{
    [self initObject];
    self.view.backgroundColor = kWhiteColor;
    [self.view addSubview:self.tableview];
}

#pragma mark --initview

-(UITableView*)tableview
{
    if (!_tableview)
    {
        
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableview registerClass:[DiscountTypeCell class] forCellReuseIdentifier:DISCOUNTTYPECELL];
        _tableview.showsVerticalScrollIndicator = NO;
        
    }
    return _tableview;
}

-(void)initObject{
    
    dataArray = @[@{@"icon": @"CategoryMeishi", @"text":@"美食"},
                  @{@"icon": @"CategoryDianyin", @"text": @"电影",},
                  @{@"icon": @"CategoryWaimai", @"text": @"外卖"},
                  @{@"icon": @"CategoryLiren", @"text": @"丽人"},
                  @{@"icon": @"CategoryIconID1", @"text": @"全部"}];
}


#pragma mark --UITableViewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *theCell=nil;
    
    if (indexPath.section == 0) {
        
        DiscountTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:DISCOUNTTYPECELL];
        if (cell == nil) {
            
            cell = [[DiscountTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISCOUNTTYPECELL];
        }
        
    
        cell.typeActionBlock = ^(int buttonTag){
            
            if (buttonTag == 4)
            {
                DiscountAllTypeController *alltype = [[DiscountAllTypeController alloc]init];
               [alltype setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:alltype animated:YES];
            }
            
            
        };
        
        cell.buttonArray = dataArray;
        theCell = cell;

        
    }else{
       
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            theCell = cell;
        }
    }
    
    
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return theCell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        return 70;
        
    }else if (indexPath.section == 1){
        
        return 160;
        
    }else{
        
        return 100;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 20;
}



@end














