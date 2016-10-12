//
//  HomeViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderTypeCell.h"
#import "newDiscountCell.h"
#import <MJRefresh/MJRefresh.h>
#import "webViewController.h"
#import "homeLikeListModel.h"
#import "homeLikeListCell.h"
#import "DXPopover.h"
#import "popTableview.h"
#import "TTBBCitySelectController.h"
#import "FoodSearchViewController.h"

#define HEADERTYPECELL @"HomeHeaderTypeCell"
#define NEWDISCOUNTCELL @"NewDicountCell"
#define HOMELIKELISTCELL @"homeLikeListCell"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    
    UITableView *HomeTableView;
    
    NSArray *butCountArray;
    NSMutableDictionary *buttonDict;
    NSMutableArray *dataArray;
    
    UIButton *funButton;
  
}
@property(nonatomic, strong) DXPopover *popover;
@property(nonatomic,strong)UIButton *cityButton;
@property(nonatomic,strong)UIButton *searchButton;
@end



@implementation HomeViewController


-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:kOrangeColor];
    [self initObject];
    [self createBarItemButton];
    [self createTableView];
}


-(void)initObject{
    buttonDict = [NSMutableDictionary new];
    dataArray = [NSMutableArray new];
    butCountArray = @[@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png"];
    NSArray *textArray = @[@"学习培训",@"旅游",@"美食",@"电影",@"休闲娱乐",@"美发",@"外卖",@"酒店",@"火车机票",@"周边游",@"KTV",@"运动健身",@"度假套餐",@"汽车出行",@"购物",];
    /*大众点评接口已加密，抓不到数据，这里大家换成自己网络请求的就可以*/
    [buttonDict setObject:butCountArray forKey:@"buttonImage"];
    [buttonDict setObject:textArray forKey:@"buttonText"];
   
    homeLikeListModel *model = [homeLikeListModel new];
    model.title = @"Pelicana百利家";
    model.distance = @"10.2km";
    model.desc = @"[4店通用]下午茶套餐";
    model.price = @"￥20.9";
    model.sell = @"已售365";
    model.iconImageUrl = @"http://i2.buimg.com/570557/b74d53082003b834.jpg";
    
    homeLikeListModel *model1 = [homeLikeListModel new];
    model1.title = @"MDL";
    model1.distance = @"10.2km";
    model1.desc = @"[155店通用]下午茶套餐,汉堡组合,建议单人使用";
    model1.price = @"￥15";
    model1.sell = @"已售2624";
    model1.iconImageUrl = @"http://i2.buimg.com/570557/02359439e88d41b0.jpg";
    
    homeLikeListModel *model2 = [homeLikeListModel new];
    model2.title = @"探蟹肉蟹煲";
    model2.distance = @"10.2km";
    model2.desc = @"[时代城]好吃的煲,汉堡组合,建议2人使用";
    model2.price = @"￥118";
    model2.sell = @"已售4295";
    model2.iconImageUrl = @"http://i2.buimg.com/570557/1753c6a12de9dbfb.jpg";
    
    [dataArray addObject:model];
    [dataArray addObject:model1];
    [dataArray addObject:model2];
    
}

-(void)createTableView
{
    HomeTableView = [UITableView new];
    HomeTableView.delegate = self;
    HomeTableView.dataSource = self;
    HomeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [HomeTableView registerClass:[HomeHeaderTypeCell class] forCellReuseIdentifier:HEADERTYPECELL];
    [HomeTableView registerClass:[newDiscountCell class] forCellReuseIdentifier:NEWDISCOUNTCELL];
    [HomeTableView registerClass:[homeLikeListCell class] forCellReuseIdentifier:HOMELIKELISTCELL];
    [self.view addSubview:HomeTableView];
    
    
    [HomeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
}
-(UIButton*)cityButton
{
    if (!_cityButton) {
        
        NSString *cityNmae = [fileCacheManager getObjectWithFileName:cityNameKey];
       
        
        _cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cityButton.frame = CGRectMake(0, 0, 60, 30);
        _cityButton.titleLabel.font = kFont(13);
       
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


-(void)createBarItemButton
{
   
    funButton = [UIButton buttonWithType:UIButtonTypeCustom];
    funButton.frame = CGRectMake(0, 0, 25, 25);
    [funButton setBackgroundImage:[UIImage imageNamed:@"home_add"] forState:UIControlStateNormal];
    [funButton addTarget:self action:@selector(popfun) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:funButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.cityButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.titleView = self.searchButton;
  
}


#pragma mark -- UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *theCell = nil;
    
    
    
    if (indexPath.section == 0)
    {
        
        HomeHeaderTypeCell *Cell = [[HomeHeaderTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HEADERTYPECELL];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.buttonDict = buttonDict;
        
        theCell = Cell;
    }else if (indexPath.section == 1){
        
        newDiscountCell *Cell = [[newDiscountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NEWDISCOUNTCELL];
        
        //大众中间的全是HTML5网页，这里只做两个模拟
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.leftUrl = @"http://i2.buimg.com/570557/9cc428e741778a9d.jpg";
        Cell.rightUrl = @"http://i2.buimg.com/570557/8bceb7e3b78c931a.jpg";
        Cell.leftBlock = ^(){
            
            webViewController *webview = [[webViewController alloc]init];
            [webview setHidesBottomBarWhenPushed:YES];
            webview.url = @"http://h5.dianping.com/app/commontemplate/mfchwl0715/main.html?source=mfchwl0715&cityid=7&latitude=22.59861&longitude=114.00041&time=20160809170529&title=%E7%AC%AC%E4%B8%80%E5%8D%95%E5%85%8D%E8%B4%B9&product=dpapp";
            [self.navigationController pushViewController:webview animated:YES];
            
        };
        
        Cell.rightBlock = ^(){
            
            webViewController *webview = [[webViewController alloc]init];
             [webview setHidesBottomBarWhenPushed:YES];
            webview.url = @"http://h5.dianping.com/app/commontemplate/mfchwl0715/main.html?source=mfchwl0715&cityid=7&latitude=22.59861&longitude=114.00041&time=20160809170529&title=%E7%AC%AC%E4%B8%80%E5%8D%95%E5%85%8D%E8%B4%B9&product=dpapp";
            [self.navigationController pushViewController:webview animated:YES];
        };
        
        theCell = Cell;

        
    }else if (indexPath.section == 2){
        
       homeLikeListCell  *Cell = [[homeLikeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HOMELIKELISTCELL];
        
       Cell.selectionStyle = UITableViewCellSelectionStyleNone;
       Cell.likeModel = [dataArray objectAtIndex:indexPath.row];

        theCell = Cell;
    }
    
    
    
    return theCell;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgview = [UIView new];
    bgview.frame = CGRectMake(0, 10, KSCREEN_WIDTH, 30);
    bgview.backgroundColor = [UIColor whiteColor];

    UILabel * label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.text = @"猜你喜欢";
    label.font = [UIFont systemFontOfSize:11];
    label.frame = CGRectMake(20, 5, 100, 20);
    [bgview addSubview:label];
    
    return bgview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 2)
    {
        
        return 40;
        
    }else
    {
        
        return 0;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 2) {
        
        return dataArray.count;
        
    }else{
        
        return 1;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 180;
        
    }else if (indexPath.section == 1){
        
        return 100;
        
    }else {
        
        return 100;
        
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma --mark event respond


-(void)popfun
{
    
    NSArray *array = @[@"写点评",@"添加商户",@"扫一扫",@"付款码"];
    NSArray *imageArray = @[@"movie_review",@"mc_wecard",@"shortcut_scan",@"movie_qrcode"];
    
    popTableview  *pop = [[popTableview alloc]initWithFrame:CGRectMake(0, 0, 120, array.count * 44) array:array imageArray:imageArray];
    self.popover = [DXPopover new];
    self.popover.backgroundColor = [UIColor whiteColor];
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(funButton.frame), CGRectGetMaxY(funButton.frame) + 25);
    [self.popover showAtPoint:startPoint
               popoverPostion:DXPopoverPositionDown
              withContentView:pop
                       inView:self.tabBarController.view];

}

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























