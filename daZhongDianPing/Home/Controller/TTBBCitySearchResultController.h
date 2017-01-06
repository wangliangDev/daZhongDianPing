//
//  TTBBCitySearchResultController.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/9/29.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didSelectRowAtIndexPathBlock)(NSString *cityName);
typedef void(^scrollViewDidScrollBlock)();

@interface TTBBCitySearchResultController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    
}

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)didSelectRowAtIndexPathBlock didSelectRowAtIndexPathBlock;
@property(nonatomic,copy)scrollViewDidScrollBlock scrollViewDidScrollBlock;
@end
