//
//  homeLikeListModel.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/18.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface homeLikeListModel : JSONModel{
    
    
    
}

@property(nonatomic,strong) NSString <Optional>* iconImageUrl;
@property(nonatomic,strong) NSString <Optional>* title;
@property(nonatomic,strong) NSString <Optional>* distance;
@property(nonatomic,strong) NSString <Optional>* desc;
@property(nonatomic,strong) NSString <Optional>* price;
@property(nonatomic,strong) NSString <Optional>* oldPrice;
@property(nonatomic,strong) NSString <Optional>* sell;


@end