//
//  TTBBCitySelectController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/27.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBCitySelectController.h"
#import "SelectCityCell.h"
#import "TTBBCitySearchResultController.h"

#define SELECTCITYCELL @"SelectCityCell"

@implementation cityModel



@end


@interface TTBBCitySelectController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
    
    
}

@property(nonatomic,strong)UIButton *backGroundButton;
@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)NSDictionary *cityDict;
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSArray *locationArray;
@property(nonatomic,strong)NSMutableArray *hotCityArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *SearchView;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)NSMutableArray *pinYinArray;
@property(nonatomic,strong)TTBBCitySearchResultController *searchResultController;

@end



@implementation TTBBCitySelectController



-(void)viewDidLoad
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initObject];
    self.title = @"城市选择";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_dismissItem"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 25, 25);
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;

    [self.view addSubview:self.tableView];
}

-(void)initObject{
    
    
    NSArray *keysArray = [self.cityDict allKeys];
    
    [self.titleArray addObjectsFromArray:[keysArray sortedArrayUsingSelector:@selector(compare:)]];
    
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *citylistArray = [self.cityDict objectForKey:obj];
        
        [self.dataArray addObject:citylistArray];
    }];
    
    [self.indexArray addObjectsFromArray:self.titleArray];
    [self.titleArray insertObject:@"定位城市" atIndex:0];
    [self.titleArray insertObject:@"热门城市" atIndex:1];
    
    NSArray *hotArray = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"厦门",@"武汉"];
    [self.hotCityArray addObjectsFromArray:hotArray];
    [self.dataArray insertObject:self.locationArray atIndex:0];
    [self.dataArray insertObject:self.hotCityArray atIndex:1];
    
}



#pragma mark -- initView

-(UITableView*)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.SearchView;
        [_tableView registerClass:[SelectCityCell class] forCellReuseIdentifier:SELECTCITYCELL];
        
    }
    
    return _tableView;
    
}
-(UIButton*)backGroundButton
{
    
    if (!_backGroundButton) {
        
        _backGroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backGroundButton.frame = CGRectMake(0, 40, KSCREEN_WIDTH, KSCREEN_HEIGHT-40);
        _backGroundButton.alpha = 0;
        _backGroundButton.backgroundColor = kBlackColor;
        [_backGroundButton addTarget:self action:@selector(removeBg) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backGroundButton];
    }
    
    return _backGroundButton;
}
-(UIView *)SearchView
{
    
    if (!_SearchView) {
        
        _SearchView = [UIView new];
        _SearchView.frame = CGRectMake(0, 0, KSCREEN_WIDTH - 20, 44);
        _SearchView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [_SearchView addSubview:self.searchBar];
    }
    
    return _SearchView;
}

-(UISearchBar*)searchBar
{
    
    if (!_searchBar)
    {
        
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15, 7, KSCREEN_WIDTH-30, 30)];
        _searchBar.placeholder = @"请输入城市名称/拼音或第一个字母";
        _searchBar.delegate = self;
        _searchBar.barStyle = UIBarMetricsDefault;
        _searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:_searchBar.frame.size];
        [_searchBar setTranslucent:YES];
    }
    
    return _searchBar;
}
-(TTBBCitySearchResultController*)searchResultController
{
    
    DefineWeakSelf;
    
    if (!_searchResultController) {
        
        _searchResultController = [TTBBCitySearchResultController new];
        _searchResultController.view.frame = CGRectMake(0, 40, KSCREEN_WIDTH, KSCREEN_HEIGHT-40);
        [self addChildViewController:_searchResultController];
        [self.view addSubview:_searchResultController.view];
        _searchResultController.didSelectRowAtIndexPathBlock = ^(NSString *cityName){
            
            if (weakSelf.setCityButtonBlock) {
                
                weakSelf.setCityButtonBlock(cityName);
                [weakSelf dismiss];
            }
        };
        _searchResultController.scrollViewDidScrollBlock =^(){
            
            [weakSelf.searchBar resignFirstResponder];
        };
    }
    
    return _searchResultController;
    
}

#pragma mark -- initObject

-(NSMutableArray*)indexArray
{
    
    if (!_indexArray) {
        
        _indexArray = [NSMutableArray new];
    }
    
    return _indexArray;
}

-(NSMutableArray*)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray new];
    }
    
    return _dataArray;
}

-(NSMutableArray*)titleArray
{
    
    if (!_titleArray) {
        
        _titleArray = [NSMutableArray new];
    }
    
    return _titleArray;
}

-(NSMutableArray*)pinYinArray
{
    
    if (!_pinYinArray) {
        
        _pinYinArray = [NSMutableArray new];
    }
    
    return _pinYinArray;
}

-(NSDictionary*)cityDict
{
    if (!_cityDict) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"citydict" ofType:@"plist"];
        _cityDict = [[NSDictionary alloc]initWithContentsOfFile:path];
    }
    
    return _cityDict;
}
-(NSArray*)locationArray
{
    if(!_locationArray){
        
        _locationArray = @[@"深圳"];
    }
    
    return _locationArray;
}

-(NSMutableArray*)hotCityArray
{
    if (!_hotCityArray) {
        
        _hotCityArray = [NSMutableArray new];
    }
    
    return _hotCityArray;
}





#pragma mark --event respond

-(void)dismiss
{
    [self.searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)removeBg
{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.backGroundButton.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        
    }];
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
//判断是否字母
-(BOOL)isLetterWithstring:(NSString *)string
{
    NSString* number=@"^[A-Za-z]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return  [numberPre evaluateWithObject:string];
}
//把汉字变拼音
- (NSString *)Charactor:(NSString *)aString getFirstCharactor:(BOOL)isGetFirst
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinYin = [str capitalizedString];
    //转化为大写拼音
    if(isGetFirst)
    {
        //获取并返回首字母
        return [pinYin substringToIndex:1];
    }
    else
    {
        return pinYin;
    }
}


-(void)searchBeginEdit{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.backGroundButton.alpha = 0.6;
        
    } completion:^(BOOL finished) {
        
        

    }];
}
-(void)searchString:(NSString*)string
{
      NSMutableArray *resultArray  =  [NSMutableArray new];
    [self.pinYinArray removeAllObjects];
    if ([self isLetterWithstring:string])
    {
        NSString *upperCaseString2 = string.uppercaseString;
        NSString *firstString = [upperCaseString2 substringToIndex:1];
        NSArray *array = [self.cityDict objectForKey:firstString];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            cityModel *moel = [cityModel new];
            
            moel.pingYin = [self Charactor:obj getFirstCharactor:NO];
            moel.cityName = obj;
            [self.pinYinArray addObject:moel];
        }];
       
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"pingYin BEGINSWITH[c] %@",string];
        NSArray *smallArray = [self.pinYinArray filteredArrayUsingPredicate:pred];
        
        [smallArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            cityModel *model = obj;
            [resultArray addObject:model.cityName];
        }];
        
    }else{
        
        [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSArray *sectionArray  = obj;
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] %@",string];
            NSArray *array = [sectionArray filteredArrayUsingPredicate:pred];
            [resultArray addObjectsFromArray:array];
        }];
    }
    
    self.searchResultController.dataArray = resultArray;
    [self.searchResultController.tableView reloadData];
}



-(void)CancelButtonAction
{
   
    self.backGroundButton.alpha = 0.0;
    [self.searchResultController.view removeFromSuperview];
     self.searchResultController = nil;
    
}


#pragma mark --UITableViewDelegate

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    return self.indexArray;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 || section == 1) {
        
        return 1;
    }else{
        
        NSArray *array = [self.dataArray objectAtIndex:section];
        
        return array.count;
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        
        int count;
        if (self.hotCityArray.count %3 == 0) {
            
            count = (int)(self.hotCityArray.count / 3) *35 ;
        }else{
            
             count = (int)(self.hotCityArray.count / 3 +1) * 35;
        }
        
        return count;
    }else{
        
        return 44;
    }
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(50, 10, 50, 20);
    label.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    label.text = [NSString stringWithFormat:@"    %@",[self.titleArray objectAtIndex:section]];;
   
    
    label.font = kFont(12);
    
    
    return label;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCell;
    
    if (indexPath.section < 2)
    {
        SelectCityCell *cell = [[SelectCityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SELECTCITYCELL];
        cell.buttonArray = [self.dataArray objectAtIndex:indexPath.section];
        cell.citySelectBlock = ^(NSString *cityName){
            
            if (self.setCityButtonBlock) {
                
                self.setCityButtonBlock(cityName);
                [self dismiss];
            }
        };
        theCell = cell;
        
        
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell==nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *array = [self.dataArray objectAtIndex:indexPath.section];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
        theCell = cell;

    }
    
    return theCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 || indexPath.section == 1)
    {
        
    }else{
        
        NSArray *array = [self.dataArray objectAtIndex:indexPath.section];
        NSString * city = [array objectAtIndex:indexPath.row];
        
        if (self.setCityButtonBlock) {
            
            self.setCityButtonBlock(city);
            [self dismiss];
        }
    }
}


#pragma mark --UISearchBarDelegate

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    [searchBar setShowsCancelButton:YES animated:YES];
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
           
            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }

    if (searchBar.text.length == 0 || [searchBar.text isEqualToString:@""]) {
        
         [self searchBeginEdit];
        
    }else{
        
        [self searchString:searchBar.text];
    }
    
   
}




// 当搜索内容变化时，执行该方法。
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    
         [self searchString:searchText];
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    searchBar.text = nil;
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    
    [self CancelButtonAction];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
        CGFloat sectionHeaderHeight = 20;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    
}



@end





































