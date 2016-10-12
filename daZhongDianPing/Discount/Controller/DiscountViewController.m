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
#import "TTBBCitySelectController.h"
#import "DiscountFoodCell.h"
#import "DiscountFoodModel.h"
#import "webViewController.h"
#import "homeLikeListModel.h"
#import "homeLikeListCell.h"
#import "FoodSearchViewController.h"


#define DISCOUNTTYPECELL @"DiscountTypeCell"
#define DISCOUNTFOODCELL @"DiscountFoodCell"
#define HOMELIKELISTCELL @"homeLikeListCell"

@interface DiscountViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *dataArray;
    NSDictionary *foodDict;
    NSMutableArray *shopListArray;
    
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *cityButton;
@property(nonatomic,strong)UIButton *searchButton;


@end

@implementation DiscountViewController


-(void)viewDidLoad
{
    [self initObject];
    self.view.backgroundColor = kWhiteColor;
    [self.view addSubview:self.tableview];
    
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
        [_tableview registerClass:[DiscountTypeCell class] forCellReuseIdentifier:DISCOUNTTYPECELL];
        [_tableview registerClass:[DiscountFoodCell class] forCellReuseIdentifier:DISCOUNTFOODCELL];
        [_tableview registerClass:[homeLikeListCell class] forCellReuseIdentifier:HOMELIKELISTCELL];
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



-(void)initObject{
    
    dataArray = @[@{@"icon": @"CategoryMeishi", @"text":@"美食"},
                  @{@"icon": @"CategoryDianyin", @"text": @"电影",},
                  @{@"icon": @"CategoryWaimai", @"text": @"外卖"},
                  @{@"icon": @"CategoryLiren", @"text": @"丽人"},
                  @{@"icon": @"CategoryIconID1", @"text": @"全部"}];
    DiscountFoodModel *foodModel = [DiscountFoodModel new];
    foodModel.imageUrl = @"http://www.dpfile.com/sc/ares_pics/a92e2a8104f824137c745e0847560bde.jpg";
    foodModel.content = @"风味新疆菜";
    foodModel.smallImageUrl = @"http://www.dpfile.com/sc/ares_pics/71e624f959235fc377d53449955e5061.png";
    foodModel.hot = @"2.7";
    
    DiscountFoodModel *foodModel2 = [DiscountFoodModel new];
    foodModel2.imageUrl = @"http://www.dpfile.com/sc/ares_pics/e4c982652704db4e7ddcb0eef37247b1.jpg";
    foodModel2.content = @"海鲜盛宴";
    foodModel2.smallImageUrl = @"http://www.dpfile.com/sc/ares_pics/71e624f959235fc377d53449955e5061.png";
    foodModel2.hot = @"3.0";
    
    DiscountFoodModel *foodModel3 = [DiscountFoodModel new];
    foodModel3.imageUrl = @"http://www.dpfile.com/sc/ares_pics/5e8d8ced3aee55fbcf8912d81b1e33de.jpg";
    foodModel3.content = @"海鲜盛宴";
    foodModel3.smallImageUrl = @"http://www.dpfile.com/sc/ares_pics/71e624f959235fc377d53449955e5061.png";
    foodModel3.hot = @"3.0";
    
    
    
    NSArray *array = @[foodModel,foodModel2,foodModel3];
    
    foodDict = @{@"title":@"美味FOOD",@"button":array,@"allCount":@"14"};
    
    shopListArray = [NSMutableArray new];
    homeLikeListModel *model = [homeLikeListModel new];
    model.title = @"Pelicana百利家";
    model.distance = @"10.2km";
    model.desc = @"[4店通用]下午茶套餐";
    model.price = @"￥20.9";
    model.sell = @"已售365";
    model.iconImageUrl = @"http://p0.meituan.net/deal/452d4488d5f86812e6a07ff53548442037020.jpg%40200w_200h_1e_1c_1l_80q";
    
    homeLikeListModel *model1 = [homeLikeListModel new];
    model1.title = @"MDL";
    model1.distance = @"10.2km";
    model1.desc = @"[155店通用]下午茶套餐,汉堡组合,建议单人使用";
    model1.price = @"￥15";
    model1.sell = @"已售2624";
    model1.iconImageUrl = @"http://p0.meituan.net/deal/3833d5cc52641a7a48e918ef6fc3560c463245.jpg%40200w_200h_1e_1c_1l_80q";
    
    homeLikeListModel *model2 = [homeLikeListModel new];
    model2.title = @"探蟹肉蟹煲";
    model2.distance = @"10.2km";
    model2.desc = @"[时代城]好吃的煲,汉堡组合,建议2人使用";
    model2.price = @"￥118";
    model2.sell = @"已售4295";
    model2.iconImageUrl = @"http://p0.meituan.net/deal/ca707cb9bde1da3466a1ded3e9a01ff1123219.jpg%40200w_200h_1e_1c_1l_80q";
    
    [shopListArray addObject:model];
    [shopListArray addObject:model1];
    [shopListArray addObject:model2];
    
    
    
}


#pragma mark --UITableViewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DefineWeakSelf;
    
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
               [weakSelf.navigationController pushViewController:alltype animated:YES];
            }
            
            
        };
        cell.hotIndexSelectBlock = ^(int index){
            
            webViewController *webview = [[webViewController alloc]init];
            [webview setHidesBottomBarWhenPushed:YES];

            if (index == 0) {
                
                   webview.url = @"http://h5.dianping.com/app/ziggurat/109/list.html?bizId=20160930052253-cc901b9e-1408&product=dpapp";
                   webview.title = @"甜品时光";
            }else if (index == 1){
                
                   webview.url = @"http://h5.dianping.com/app/group-city-daily/dailylist.html?cityid=7";
                   webview.title = @"生活研究所";
            }else if (index == 2){
                
                   webview.url = @"http://m.dianping.com/mobile/event/list?source=dpapp&token=&cityid=7&product=dpapp";
                   webview.title = @"好吃好玩";
            }
            
            
            
            [weakSelf.navigationController pushViewController:webview animated:YES];

        };
        cell.buttonArray = dataArray;
        theCell = cell;

        
    }else if (indexPath.section == 1){
        
        DiscountFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:DISCOUNTFOODCELL];
        
        if (cell == nil) {
            
            cell = [[DiscountFoodCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISCOUNTFOODCELL];
        }
        cell.allFoodBlock = ^(){
            
            webViewController *webview = [[webViewController alloc]init];
            [webview setHidesBottomBarWhenPushed:YES];
            
            
                webview.url = @"http://m.dianping.com/yy/zig/cgi/render/16/latest/quality-promotion?dpid=d9abeab5af0b5ac9cc8f0a0a2317e24d&cityid=7&sectionid=4&title=%E7%BE%8E%E5%91%B3%E7%B2%BE%E9%80%89&product=dpapp";
                webview.title = @"全部专题";
            
            
            [weakSelf.navigationController pushViewController:webview animated:YES];
        };
        
        cell.foodActionBlock = ^(int index){
            
            webViewController *webview = [[webViewController alloc]init];
            [webview setHidesBottomBarWhenPushed:YES];
            
            if (index == 0) {
                
                webview.url = @"http://h5.dianping.com/app/ziggurat/109/list.html?bizId=20160930052253-cc901b9e-1408&product=dpapp";
                webview.title = @"甜品时光";
            }else if (index == 1){
                
                webview.url = @"http://h5.dianping.com/app/group-city-daily/dailylist.html?cityid=7";
                webview.title = @"生活研究所";
            }else if (index == 2){
                
                webview.url = @"http://m.dianping.com/mobile/event/list?source=dpapp&token=&cityid=7&product=dpapp";
                webview.title = @"好吃好玩";
            }
            
            
            
            [self.navigationController pushViewController:webview animated:YES];
        };
        
        
        cell.buttonDict = foodDict;
        theCell = cell;
        
        
    }else{
       
        homeLikeListCell  *Cell = [tableView dequeueReusableCellWithIdentifier:HOMELIKELISTCELL];
        
        if (Cell == nil) {
            
            Cell = [[homeLikeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HOMELIKELISTCELL];

        }
        
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.likeModel = [shopListArray objectAtIndex:indexPath.row];
        
        theCell = Cell;    }
    
    
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return theCell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 || section == 1) {
        
        return 1;
    }else{
        
        return shopListArray.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        return 110;
        
    }else if (indexPath.section == 1){
        
        return 240;
        
    }else{
        
        return 100;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        
        return 15;
    }else{
        
        return 0;
    }
    
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














