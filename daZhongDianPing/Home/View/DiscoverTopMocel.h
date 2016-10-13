//
//  DiscoverTopMocel.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverTopMocel : JSONModel{
    
    
}

@property(nonatomic,strong)NSString <Optional>*title;
@property(nonatomic,strong)NSString <Optional>*flagTitle;
@property(nonatomic,assign)int flag;
@property(nonatomic,strong)NSString <Optional>*imageUrl;
@property(nonatomic,strong)NSString <Optional>*content;
@property(nonatomic,strong)NSString <Optional>*contentUrl;
@property(nonatomic,assign)int hotCount;



@end
