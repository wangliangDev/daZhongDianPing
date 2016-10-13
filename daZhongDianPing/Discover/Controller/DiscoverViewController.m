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
#import "FindGoodShopCell.h"
#import "DiscoverTopCell.h"
#import "DiscoverTopMocel.h"
#import "DiscoverAskCell.h"
#import "DiscoverAskModel.h"
#import "webViewController.h"


#define FINDGOODSHOPCELL @"FindGoodShopCell"
#define TOPCELL @"DiscoverTopCell"
#define ASKCELL @"DiscoverAskCell"

@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSDictionary *findShopDict;
    NSMutableArray *topDataArray;
    NSMutableArray *askDataArray;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *cityButton;
@property(nonatomic,strong)UIButton *searchButton;
@end

@implementation DiscoverViewController


-(void)viewDidLoad
{
    
    [self initObject];
    self.view.backgroundColor = kWhiteColor;
    [self.view addSubview:self.tableview];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.cityButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.titleView = self.searchButton;
}

-(void)initObject{
    
    topDataArray = [NSMutableArray new];
    askDataArray = [NSMutableArray new];
    
    NSDictionary *dict1 = @{@"imageUrl":@"http://p1.meituan.net/fifa/c80d72f69977c23fa8124f40c0f869ac377535.png",
                            @"smallTitle":@"深夜食堂",
                            @"discription":@"用美食温暖夜归人"
                            };
    NSDictionary *dict2 = @{@"imageUrl":@"http://p1.meituan.net/fifa/bcd5587415c52dd52964bc09047200d096945.jpg",
                            @"smallTitle":@"火锅英雄",
                            @"discription":@"热辣滚烫蠢蠢欲动"
                            };
    
    NSArray *array = @[dict1,dict2];
    findShopDict = @{@"title":@"探好店SHOP >",
                     
                     @"contentArray":array
                     
                    };
    
   
    
    
    NSArray *topArray = @[
                          @{@"title":@"那些适合装逼的",
                            @"flag":@0,
                            @"imageUrl":@"http://p1.meituan.net/groupbackwebimage/d7c828d6edb14d04ec6c368bf927be20262679.png",
                            @"content":@"夏天到了，妹子们都喜欢拍拍",
                            @"hotCount":@48809,
                            @"flagTitle":@"美食榜",
                            @"contentUrl":@"http://m.dianping.com/toplist/detail?listId=2944734&t=1&source=2&utm_source=tpl_detail&token=&product=dpapp"
                            },
                         
                          @{@"title":@"环境气质佳 10大",
                            @"flag":@1,
                            @"imageUrl":@"http://p1.meituan.net/groupbackwebimage/d4a61a6479bfbb7d934544fac58bdadd71969.jpg",
                            @"content":@"如果你是女生当然不能错过,然而并没有什么用处，这当然是不好的行为",
                            @"hotCount":@27405,
                            @"flagTitle":@"达人榜",
                            @"contentUrl":@"http://m.dianping.com/toplist/detail?listId=2936085&t=1&source=2&utm_source=tpl_detail&token=&product=dpapp"
                            },
                          @{@"title":@"“冲环境”去的美",
                            @"flag":@2,
                            @"imageUrl":@"http://p0.meituan.net/groupbackwebimage/1bab65f0c56901c5c18f67a6bdf8e0b5288634.png",
                            @"content":@"环境典雅|档次高价格贵|雅座安静",
                            @"hotCount":@34357,
                            @"flagTitle":@"推荐榜",
                            @"contentUrl":@"http://m.dianping.com/toplist/detail?listId=2936612&t=1&source=2&utm_source=tpl_detail&token=&product=dpapp"
                            }
                          
                          ];
    
    NSArray *tempArray = [DiscoverTopMocel arrayOfModelsFromDictionaries:topArray];
    
    [topDataArray addObjectsFromArray:tempArray];
    [topDataArray insertObject:@"" atIndex:0];
    
    NSArray *askArray = @[
                          @{@"title":@"一碗白米饭，配什么最下饭",
                            @"headIconUrl":@"http://p1.meituan.net/groupbackwebimage/d7c828d6edb14d04ec6c368bf927be20262679.png",
                            @"content":@"白兔牛奶糖:必须是鱼香肉丝！！！一盘鱼香肉丝我可以吃三碗白米饭",
                            @"contentUrl":@"http://m.dianping.com/forum/question/13931047?token=&product=dpapp",
                            @"askCount":@"230",
                            @"flagTitle":@"吃货最爱问",
                           
                            },
                          
                          @{@"title":@"有没有适合上班吃的小零食？求推荐!",
                            @"headIconUrl":@"http://p0.meituan.net/groupbackwebimage/1bab65f0c56901c5c18f67a6bdf8e0b5288634.png",
                            @"content":@"团团猫:bankok cookies ,记得买海苔味和绿咖啡味，其它的不要买",
                            @"contentUrl":@"http://m.dianping.com/forum/question/13045740?token=&product=dpapp",
                            @"askCount":@"130",
                            @"flagTitle":@"吃货最爱问",
                            }
                         
                          ];
    
    NSArray *temp2Array = [DiscoverAskModel arrayOfModelsFromDictionaries:askArray];
    
    [askDataArray addObjectsFromArray:temp2Array];
    [askDataArray insertObject:@"" atIndex:0];
    
    
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
        [_tableview registerClass:[FindGoodShopCell class] forCellReuseIdentifier:FINDGOODSHOPCELL];
        [_tableview registerClass:[DiscoverTopCell class] forCellReuseIdentifier:TOPCELL];
        [_tableview registerClass:[DiscoverAskCell class] forCellReuseIdentifier:ASKCELL];
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

#pragma mark --UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 || section == 1) {
        
        return 1;
    }else if (section == 2){
        
        return topDataArray.count ;
        
    }else {
        
        return 3;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        
        return 0;
    }else{
        
        return 10;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 60;
        
    }else if (indexPath.section == 1)
    {
        return 180;
        
    }else if (indexPath.section == 2)
    {
        
        if (indexPath.row == 0)
        {
            
            return 44;
            
        }else{
            
             return 80;
        }
        
    }else if (indexPath.section == 3)
    {
        
        if (indexPath.row == 0)
        {
            return 44;
            
        }else{
            
            return 100;
        }
        
    }else{
        
        return 100;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCell = nil;
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        theCell = cell;
        
    }else if (indexPath.section == 1){
        
        FindGoodShopCell *cell = [tableView dequeueReusableCellWithIdentifier:FINDGOODSHOPCELL];
        
        if (cell == nil) {
            
            cell = [[FindGoodShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FINDGOODSHOPCELL];
        }
        cell.contentDict = findShopDict;
        
        cell.allGoodShopBlock = ^(){
            
            
        };
        
        cell.typeActionBlock = ^(UIButton *button){
            
            
        };
        
        theCell =cell;
        
    }else if (indexPath.section == 2)
    {
        
        if (indexPath.row == 0)
        {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"section2cell"];
            
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"section2cell"];
            }
            
            UIImageView * _line = [UIImageView new];
            _line.image = [UIImage imageNamed:@"Seperate_Line"];
            _line.frame = CGRectMake(0, 43, KSCREEN_WIDTH, 1);
            [cell.contentView addSubview:_line];
            
            UILabel *label = [UILabel new];
            label.text = @"排行榜TOP >";
            label.font = kBoldFont(16);
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(KSCREEN_WIDTH*0.2, 0, KSCREEN_WIDTH*0.6, 44);
            [cell.contentView addSubview:label];

            theCell = cell;
            
        }
        else
        {
            
            DiscoverTopCell *cell = [tableView dequeueReusableCellWithIdentifier:TOPCELL];
            
            if (cell == nil)
            {
                
                cell = [[DiscoverTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TOPCELL];
            }
            cell.topModel = [topDataArray objectAtIndex:indexPath.row];
            theCell =cell;
        }
        
    }else if (indexPath.section == 3){
        
        if (indexPath.row == 0)
        {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"section3cell"];
            
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"section3cell"];
            }
            
            
            UIImageView * _line = [UIImageView new];
            _line.image = [UIImage imageNamed:@"Seperate_Line"];
            _line.frame = CGRectMake(0, 43, KSCREEN_WIDTH, 1);
            [cell.contentView addSubview:_line];
            
            
            UILabel *label = [UILabel new];
            label.text = @"问答";
            label.font = kBoldFont(16);
            label.frame = CGRectMake(10, 0, 50, 44);
            [cell.contentView addSubview:label];
            
            UILabel *allAsklabel = [UILabel new];
            allAsklabel.text = @"全部544058个问答";
            allAsklabel.font = kBoldFont(11);
            allAsklabel.textColor = kDetailTextColor;
            allAsklabel.frame = CGRectMake(KSCREEN_WIDTH-160, 0, 150, 44);
            [cell.contentView addSubview:allAsklabel];

            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            theCell = cell;
            
        }else{
            
            DiscoverAskCell *cell = [tableView dequeueReusableCellWithIdentifier:ASKCELL];
            
            if (cell == nil)
            {
                
                cell = [[DiscoverAskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ASKCELL];
            }
            cell.askModel = [askDataArray objectAtIndex:indexPath.row];
            theCell =cell;
        }
        
    }else
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        theCell = cell;

        
    }
    
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return theCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    webViewController *webView = [[webViewController alloc]init];
    [webView setHidesBottomBarWhenPushed:YES];
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            webView.url = @"http://m.dianping.com/mobile/shoprank/channelindex?cityId=7&longitude=114.00034&latitude=22.59864&token=&product=dpapp";
            webView.title = @"深圳排行榜";
        }else{
            
            DiscoverTopMocel *model = [topDataArray objectAtIndex:indexPath.row];
            webView.url = model.contentUrl;
            webView.title = @"榜单详情";
        }
    }else if (indexPath.section == 3) {
        
        if (indexPath.row == 0) {
            
            webView.url = @"http://m.dianping.com/forum/question/index?token=&product=dpapp";
            webView.title = @"点评问答";
        }else{
            
            DiscoverAskModel *model = [askDataArray objectAtIndex:indexPath.row];
            webView.url = model.contentUrl;
            webView.title = @"榜单详情";
        }
    }
    
    
     [self.navigationController pushViewController:webView animated:YES];
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


