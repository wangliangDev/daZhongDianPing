//
//  DiscoverAskModel.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverAskModel : JSONModel{
    
    
}
@property(nonatomic,strong)NSString <Optional>*title;
@property(nonatomic,strong)NSString <Optional>*headIconUrl;
@property(nonatomic,strong)NSString <Optional>*content;
@property(nonatomic,strong)NSString <Optional>*contentUrl;
@property(nonatomic,strong)NSString <Optional>*askCount;
@property(nonatomic,strong)NSString <Optional>*flagTitle;
@end
