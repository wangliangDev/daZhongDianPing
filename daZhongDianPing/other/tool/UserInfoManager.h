//
//  UserInfoManager.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/23.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManager : NSObject{
    
    
}

@property(nonatomic,assign)BOOL isLogin;
/**
 *  单例类
 *
 *  @return 返回单例
 */
+(instancetype)shardManager;


-(void)loginedSaveUserInfo:(id)userInfo;

-(void)logOut;

-(UserInfoModel*)getUserInfo;

-(void)updateUserInfo:(UserInfoModel *)userModel;


@end
