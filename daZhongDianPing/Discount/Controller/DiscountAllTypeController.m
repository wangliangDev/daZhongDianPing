//
//  DiscountAllTypeController.m
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/30.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DiscountAllTypeController.h"
#import "DiscountAllTypeCell.h"
#import "DiscountAllTypeHeadCell.h"
#import "DiscountAllTypeModel.h"

#define DISALLTYPECELL @"DiscountAllTypeCell"
#define DISALLTYPEHEADCELL @"DiscountAllTypeHeadCell"

@interface DiscountAllTypeController ()<UITableViewDelegate,UITableViewDataSource,DiscountAllTypeDelegate>{
    
    NSDictionary *headDict;
    
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *allDataArray;


@end

@implementation DiscountAllTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = kWhiteColor;
    [self initObject];
    
    [self.view addSubview:self.tableView];
}



-(void)initObject{
    
    NSArray *foodArray = @[@"全部",@"火锅",@"自助餐",@"烧烤",@"奥菜",@"面包甜点",@"日本料理",@"西餐",@"咖啡厅",@"海鲜",@"韩国料理",@"东南亚菜",@"湘菜",@"小吃快餐",@"素菜"];
    NSArray *movieArray = @[@"全部",@"热映影片",@"演出赛事",@"电影院"];
    
  
    
    DiscountAllTypeModel *model = [DiscountAllTypeModel new];
    model.contentArray = foodArray;
    model.title = @"美食";
    model.icon = @"3.png";
    model.flag = NO;
    
    
    DiscountAllTypeModel *model2 = [DiscountAllTypeModel new];
    model2.contentArray = movieArray;
    model2.title = @"电影";
    model2.icon = @"4.png";
    model2.flag = NO;
    
    [self.allDataArray addObject:model];
    [self.allDataArray addObject:model2];
    
    
    NSArray *dataArray = @[@{@"icon": @"3.png", @"text":@"自助餐"},
                  @{@"icon": @"7.png", @"text": @"广东菜",},
                  @{@"icon": @"2.png", @"text": @"江浙菜"},
                  @{@"icon": @"9.png", @"text": @"机票"}
                 ];
    
    headDict = @{@"content":dataArray,@"title":@"热门推荐",@"icon":@"16"};
    
    
}
-(UITableView*)tableView
{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = RGB(245, 245, 245);
        [_tableView registerClass:[DiscountAllTypeCell class] forCellReuseIdentifier:DISALLTYPECELL];
        [_tableView registerClass:[DiscountAllTypeHeadCell class] forCellReuseIdentifier:DISALLTYPEHEADCELL];
    }
    
    return _tableView;
}


-(NSMutableArray*)allDataArray
{
    if (!_allDataArray) {
        
        _allDataArray = [NSMutableArray new];
    }
    
    return _allDataArray;
}

#pragma mark --UITableViewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *theCell = nil;
    
    
    if (indexPath.section == 0) {
        
      
          DiscountAllTypeHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:DISALLTYPEHEADCELL];
        if (cell == nil) {
            
            cell = [[DiscountAllTypeHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISALLTYPEHEADCELL];
          
        }
       
        cell.buttonDict = headDict;
        
        theCell = cell;
        
    }else{
        
        DiscountAllTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:DISALLTYPECELL];
        
        if (cell == nil) {
            
            cell = [[DiscountAllTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISALLTYPECELL];

        }
        
        cell.delegate = self;
        DiscountAllTypeModel *model =  [self.allDataArray objectAtIndex:indexPath.section-1];
        
        
        if (model.contentArray.count > 11)
        {
            if (model.flag) {
                
                
                NSDictionary *dict = @{@"buttonArray":model.contentArray,@"title":model.title ,@"icon":model.icon};
                
                cell.buttonDict = dict;
                
            }else{
                
                
                NSArray *smallArray = [model.contentArray subarrayWithRange:NSMakeRange(0, 11)];
                
                NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:smallArray];
                [tempArray insertObject:@"更多" atIndex:smallArray.count ];
                
                NSDictionary *dict = @{@"buttonArray":tempArray ,@"title":model.title ,@"icon":model.icon};
                
                cell.buttonDict = dict;
                
                
            }

        }else{
            
            NSDictionary *dict = @{@"buttonArray":model.contentArray,@"title":model.title ,@"icon":model.icon};
            
            cell.buttonDict = dict;
        }
        
      
        theCell = cell;
        
    }
    theCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return theCell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (indexPath.section == 0) {
        
        
        return 110;
        
        
    }else{
        
         DiscountAllTypeModel *model = [self.allDataArray objectAtIndex:indexPath.section-1];
        if (model.flag)
        {
            
            if (model.contentArray.count % 4 == 0 ) {
                
                return (model.contentArray.count / 4) * 40+50 ;
            }else{
                
                return (model.contentArray.count / 4 +1) * 40+50;
            }
            
            
        }else{
            
            
            if (model.contentArray.count > 11) {
                
                NSArray *smallArray = [model.contentArray subarrayWithRange:NSMakeRange(0, 11)];
                
                if (smallArray.count % 4 == 0) {
                    
                    return (smallArray.count / 4) * 40+50 ;
                    
                }else{
                    
                    return (smallArray.count / 4 +1) * 40+50 ;
                }
            }else{
                
               
    
                if (model.contentArray.count % 4 == 0 ) {
    
                    return (model.contentArray.count / 4) * 40 +50;
                    
                }else{
                    
                    return (model.contentArray.count / 4 +1) * 40+50;
                }
            }
            
        }
        
    }
    
    
 
   
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.allDataArray.count+1;
    
  
}
-(void)typeClicked:(UIButton*)button
{

    
    UITableViewCell *cell = (UITableViewCell *)[[[button superview] superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"indexPath is = %li",(long)indexPath.section);
    NSLog(@"%d",(int)button.tag);
    if (button.tag == 11)
    {
        
        DiscountAllTypeModel *model =  [self.allDataArray objectAtIndex:indexPath.section-1];
        if (model.flag == NO)
        {
            model.flag = YES;
            [self.tableView reloadData];
        }
        
       
    }
  
   
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
