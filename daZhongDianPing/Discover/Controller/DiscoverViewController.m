//
//  DiscoverViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscoverViewController.h"
#import "TTBBCitySelectController.h"
#import "FoodSearchViewController.h"


@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *cityButton;
@property(nonatomic,strong)UIButton *searchButton;
@end

@implementation DiscoverViewController


-(void)viewDidLoad
{
    
   
    self.view.backgroundColor = kWhiteColor;
//    [self.view addSubview:self.tableview];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.cityButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.titleView = self.searchButton;
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
//        [_tableview registerClass:[DiscountTypeCell class] forCellReuseIdentifier:DISCOUNTTYPECELL];
//        [_tableview registerClass:[DiscountFoodCell class] forCellReuseIdentifier:DISCOUNTFOODCELL];
//        [_tableview registerClass:[homeLikeListCell class] forCellReuseIdentifier:HOMELIKELISTCELL];
        _tableview.showsVerticalScrollIndicator = NO;
        
    }
    return _tableview;
}

-(UIButton*)cityButton
{
    if (!_cityButton) {
        
        NSString *cityNmae = [fileCacheManager getObjectWithFileName:cityNameKey];
        
        
        _cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cityButton.frame = CGRectMake(0, 0, 60, 30);
        _cityButton.titleLabel.font = kFont(13);
        [_cityButton setTitleColor:kOrangeColor forState:UIControlStateNormal];
        
        [_cityButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_cityButton addTarget:self action:@selector(selectCity) forControlEvents:UIControlEventTouchUpInside];
        
        if (cityNmae.length > 0) {
            
            [_cityButton setTitle:[NSString stringWithFormat:@"%@ v",cityNmae] forState:UIControlStateNormal];
            
        }else{
            
            [_cityButton setTitle:@"选择城市" forState:UIControlStateNormal];
        }
    }
    
    return _cityButton;
}

-(UIButton*)searchButton
{
    
    if (!_searchButton) {
        
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = CGRectMake(0, 0, 220, 30);
        _searchButton.backgroundColor = kWhiteColor;
        _searchButton.layer.cornerRadius = 15;
        [_searchButton addTarget:self action:@selector(foodSearch) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"homesSearch"];
        imageView.frame = CGRectMake(10, 7, 15, 15);
        [_searchButton addSubview:imageView];
        
        UILabel *label = [UILabel new];
        label.font = kFont(11);
        label.textColor = kGrayColor;
        label.text = @"输入商家，店铺，地址";
        label.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+10, 7, CGRectGetWidth(_searchButton.frame)-50, 15);
        [_searchButton addSubview:label];
        
        
    }
    
    return _searchButton;
}

#pragma mark --eventRespond
-(void)selectCity
{
    
    TTBBCitySelectController *cityselect = [TTBBCitySelectController new];
    cityselect.setCityButtonBlock = ^(NSString *city){
        
        [fileCacheManager saveObject:city fileName:cityNameKey];
        
        [_cityButton setTitle:[NSString stringWithFormat:@"%@ v",city] forState:UIControlStateNormal];
    };
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:cityselect];
    
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)foodSearch
{
    
    FoodSearchViewController *foodsearch = [FoodSearchViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:foodsearch];
    
    [self presentViewController:nav animated:NO completion:nil];
    
}

@end


