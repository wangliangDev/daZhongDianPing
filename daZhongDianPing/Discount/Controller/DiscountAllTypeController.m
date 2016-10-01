//
//  DiscountAllTypeController.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountAllTypeController.h"
#import "DiscountAllTypeCell.h"

#define DISALLTYPECELL @"DiscountAllTypeCell"

@interface DiscountAllTypeController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *allDataArray;
    
}
@property(nonatomic,strong)UITableView *tableView;



@end

@implementation DiscountAllTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self initObject];
    
    [self.view addSubview:self.tableView];
}



-(void)initObject{
    
    NSArray *foodArray = @[@"全部",@"火锅",@"自助餐",@"烧烤",@"奥菜",@"面包甜点",@"日本料理",@"西餐",@"咖啡厅",@"海鲜",@"韩国料理",@"东南亚菜",@"湘菜",@"小吃快餐",@"素菜"];
    NSArray *movieArray = @[@"全部",@"热映影片",@"演出赛事",@"电影院"];
    allDataArray = @[@{@"content" : foodArray ,@"title":@"美食"},
                     @{@"content" : movieArray ,@"title":@"电影"}
                     ];
    
    
}
-(UITableView*)tableView
{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[DiscountAllTypeCell class] forCellReuseIdentifier:DISALLTYPECELL];
    }
    
    return _tableView;
}

#pragma mark --UITableViewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *theCell = nil;
    
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            theCell = cell;
        }

        
    }else{
        
        DiscountAllTypeCell *cell = [[DiscountAllTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISALLTYPECELL];
        
        NSDictionary *dict = [allDataArray objectAtIndex:indexPath.section-1];
        NSArray * arr = [dict objectForKey:@"content"];
        cell.buttonArray = arr;
        theCell = cell;
        
    }
    
    
    return theCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return allDataArray.count+1;
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
