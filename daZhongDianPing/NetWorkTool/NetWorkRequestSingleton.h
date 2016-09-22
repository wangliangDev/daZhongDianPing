//
//  NetWorkRequestSingleton.h
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"


typedef void(^Success)(id result);
typedef void(^Fail)(NSString *error);

@interface NetWorkRequestSingleton : NSObject{
    
    
}


+(NetWorkRequestSingleton *)sharedManager;

-(AFHTTPRequestOperationManager *)baseHttpRquest;

-(void)getAdv:(NSDictionary *)dict url:(NSString *)url successBlock:(Success)successBlock failBlock:(Fail)FailBlock;

@end
