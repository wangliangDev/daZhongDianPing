//
//  DiscountFoodModel.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/12.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscountFoodModel : JSONModel{
    
    
}


@property(nonatomic,strong) NSString <Optional>*imageUrl;
@property(nonatomic,strong) NSString <Optional>*content;
@property(nonatomic,strong) NSString <Optional>*hot;
@property(nonatomic,strong) NSString <Optional>*smallImageUrl;

@end
