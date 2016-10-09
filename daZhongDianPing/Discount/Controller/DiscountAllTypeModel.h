//
//  DiscountAllTypeModel.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscountAllTypeModel : JSONModel{
    
    
}
@property(nonatomic,strong)NSString <Optional>*title;
@property(nonatomic,strong)NSString <Optional>*icon;
@property(nonatomic,strong)NSArray *contentArray;
@property(nonatomic,assign)BOOL flag;

@end
