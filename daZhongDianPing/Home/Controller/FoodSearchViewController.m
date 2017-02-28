//
//  FoodSearchViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/11.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "FoodSearchViewController.h"
#import "FoodSearchHeadCell.h"
#import "FoodSearchHostoryListCell.h"

#define FOODSEARCHHEADCELL @"FoodSearchHeadCell"
#define HOSTORYLISTCELL @"FoodSearchHostoryListCell"

@interface FoodSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
    
    NSArray *dataArray;
    NSMutableArray *hostoryListArray;
    
    
    
}



@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIView *tableFootView;
@property(nonatomic,strong)UIButton *clearHostoryButton;


@end

@implementation FoodSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObject];
    self.view.backgroundColor = kWhiteColor;
    self.navigationItem.titleView = self.searchBar;
    [self.view addSubview:self.tableView];
}

-(void)initObject{
    
    hostoryListArray = [NSMutableArray new];
    
    NSArray *array = [fileCacheManager getObjectWithFileName:searchHostory];
    
    [hostoryListArray addObjectsFromArray:array];
    
    dataArray = @[@"九方",@"万象城",@"西丽",@"喜茶",@"工商银行",@"幸福西饼",@"手机维修",@"小龙虾",@"螺丝粉"];
}
-(UITableView*)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[FoodSearchHeadCell class] forCellReuseIdentifier:FOODSEARCHHEADCELL];
        [_tableView registerClass:[FoodSearchHostoryListCell class] forCellReuseIdentifier:HOSTORYLISTCELL];
        _tableView.backgroundColor = RGB(235, 235, 235);
        
    
        _tableView.tableFooterView = self.tableFootView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return _tableView;
}

-(UISearchBar*)searchBar
{
    
    if (!_searchBar)
    {
        
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15, 7, KSCREEN_WIDTH-50, 30)];
        _searchBar.placeholder = @"请输入商户名，地点";
        _searchBar.delegate = self;
        _searchBar.barStyle = UIBarMetricsDefault;
        _searchBar.tintColor = kOrangeColor;
        _searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:_searchBar.frame.size];
        [_searchBar becomeFirstResponder];
        [_searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"scenic_search_bk_60x30_"] forState:UIControlStateNormal];
        [_searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"scenic_search_bk_60x30_"] forState:UIControlStateHighlighted];
        
        [_searchBar setTranslucent:YES];
    }
    
    return _searchBar;
}

-(UIView*)tableFootView
{
    if (!_tableFootView) {
        
        _tableFootView = [UIView new];
        _tableFootView.frame = CGRectMake(0, 0, KSCREEN_WIDTH, 44);
        
        [_tableFootView addSubview:self.clearHostoryButton];
    }
    
    return _tableFootView;
}

-(UIButton*)clearHostoryButton
{
    if (!_clearHostoryButton) {
        
        _clearHostoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearHostoryButton.frame = CGRectMake(0, 0, KSCREEN_WIDTH, 44);
        [_clearHostoryButton setTitle:@"清除历史记录" forState:UIControlStateNormal];
        _clearHostoryButton.titleLabel.font = kFont(13);
        _clearHostoryButton.backgroundColor = kWhiteColor;
        [_clearHostoryButton setTitleColor:kBlackColor forState:UIControlStateNormal];
        [_clearHostoryButton addTarget:self action:@selector(clearHostory:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _clearHostoryButton;
    
}
#pragma mark --UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
   
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:kOrangeColor forState:UIControlStateNormal];
            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    NSArray *array = [fileCacheManager getObjectWithFileName:searchHostory];
    
    if (![array containsObject:searchBar.text]) {
        
        [hostoryListArray addObject:searchBar.text];
    }
    
    [fileCacheManager saveObject:hostoryListArray fileName:searchHostory];
    
    if (hostoryListArray.count > 1) {
        
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:1];
        
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
    }else{
        
         [self.tableView reloadData];
    }
    
   
}




-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//取消searchbar背景色
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UITableViewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (hostoryListArray.count > 0) {
        
        if (section == 0) {
            
            return 1;
        }else{
            
            return hostoryListArray.count;
        }
        
    }else{
        
        return 1;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (hostoryListArray.count > 0) {
        
        return 2;
    }else{
        
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 35*3+20;
        
    }else{
        
        return 44;
    }
}




-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCell = nil;
    
    if (hostoryListArray.count > 0) {
        [tableView.tableFooterView setHidden:NO];
        
        if (indexPath.section == 0) {
            
            FoodSearchHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:FOODSEARCHHEADCELL];
            
            if (cell == nil) {
                
                cell = [[FoodSearchHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FOODSEARCHHEADCELL];
            }
            cell.buttonArray = dataArray;
            cell.searchTypeBlock = ^(UIButton *button){
                
                NSLog(@"%ld",(long)button.tag);
                
                NSArray *array = [fileCacheManager getObjectWithFileName:searchHostory];
                
                if (![array containsObject:button.titleLabel.text]) {
                    
                    [hostoryListArray addObject:button.titleLabel.text];
                }
                
                [fileCacheManager saveObject:hostoryListArray fileName:searchHostory];
                NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:1];
            
                [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
                

            };
            
            theCell = cell;
            
            
        }else{
            
            FoodSearchHostoryListCell *cell = [tableView dequeueReusableCellWithIdentifier:HOSTORYLISTCELL];
            
            if (cell == nil) {
                
                cell = [[FoodSearchHostoryListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HOSTORYLISTCELL];
            }
            cell.title = hostoryListArray[indexPath.row];
        
            theCell = cell;
        }
        
        
    }else{
        [tableView.tableFooterView setHidden:YES];
        FoodSearchHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:FOODSEARCHHEADCELL];
        
        if (cell == nil) {
            
            cell = [[FoodSearchHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FOODSEARCHHEADCELL];
        }
        cell.buttonArray = dataArray;
        cell.searchTypeBlock = ^(UIButton *button){
            
            NSLog(@"%ld",(long)button.tag);
            
            NSArray *array = [fileCacheManager getObjectWithFileName:searchHostory];
            
            if (![array containsObject:button.titleLabel.text]) {
                
                [hostoryListArray addObject:button.titleLabel.text];
            }
            
            [fileCacheManager saveObject:hostoryListArray fileName:searchHostory];
           
            [self.tableView reloadData];
           
        };
       
        theCell = cell;
    }
    
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return theCell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
     [self.searchBar resignFirstResponder];
}

-(void)clearHostory:(UIButton*)button{
    
    [fileCacheManager removeObjectWithFileName:searchHostory];
    [hostoryListArray removeAllObjects];
    [self.tableView reloadData];
    
}

@end











