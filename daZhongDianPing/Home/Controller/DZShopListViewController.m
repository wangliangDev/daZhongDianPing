//
//  DZShopListViewController.m
//  daZhongDianPing
//
//  Created by apple on 2016/11/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DZShopListViewController.h"
#import "DZShopListTypeCell.h"

#define DZSHOPLISTTYPECELL @"shoplistTypeCell"

@interface DZShopListViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *typeButtonArray;
}
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation DZShopListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObject];
    [self.view addSubview:self.tableView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarTintColor:kWhiteColor];
}

-(void)initObject{
    
    typeButtonArray = @[@{@"image":@"1.png",@"title":@"火锅"},
                        @{@"image":@"1.png",@"title":@"自助餐"},
                        @{@"image":@"1.png",@"title":@"西餐"},
                        @{@"image":@"1.png",@"title":@"江浙菜"},
                        @{@"image":@"1.png",@"title":@"小吃快餐"},
                        @{@"image":@"1.png",@"title":@"海鲜"},
                        @{@"image":@"1.png",@"title":@"川菜"},
                        @{@"image":@"1.png",@"title":@"东南亚菜"},
                        
                        ];
    
}

#pragma mark --UITableViewDelegate


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCell;
    
    if (indexPath.section == 0) {
        
        DZShopListTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:DZSHOPLISTTYPECELL];
        
        if (cell == nil) {
            
            cell = [[DZShopListTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DZSHOPLISTTYPECELL];
            
            
        }
        cell.typeButtonArray =typeButtonArray;
        
        theCell = cell;
    }else{
        
        
        DZShopListTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:DZSHOPLISTTYPECELL];
        
        if (cell == nil) {
            
            cell = [[DZShopListTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DZSHOPLISTTYPECELL];
            
            
        }
      
        
        theCell = cell;
        
    }
    
    
    
    
    return theCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }else{
        
        return 10;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return KSCREEN_WIDTH / 2;
    }else{
        
        return 80;
    }
}

#pragma mark --getView

-(UITableView*)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DZShopListTypeCell class] forCellReuseIdentifier:DZSHOPLISTTYPECELL];
        
    }
    
    return _tableView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
