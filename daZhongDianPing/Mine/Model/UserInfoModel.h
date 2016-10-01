//
//  UserInfoModel.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/23.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserInfoModel : JSONModel{
    
    
    
}

@property(nonatomic,strong) NSString <Optional> *userName;
@property(nonatomic,strong) NSString <Optional> *userIconUrl;
@property(nonatomic,strong) NSString <Optional> *userPhone;

@end
