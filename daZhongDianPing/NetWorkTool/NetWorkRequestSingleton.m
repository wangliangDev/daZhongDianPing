//
//  NetWorkRequestSingleton.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "NetWorkRequestSingleton.h"

@implementation NetWorkRequestSingleton



+(NetWorkRequestSingleton *)sharedManager
{
    
    static NetWorkRequestSingleton *share = nil;
    
    static dispatch_once_t one;
    
    dispatch_once(&one, ^{
        
        share = [[NetWorkRequestSingleton alloc]init];
        
    });
    
    return share;
}

-(AFHTTPRequestOperationManager *)baseHttpRquest
{
    
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    return manager;
}


-(void)getAdv:(NSDictionary *)dict url:(NSString *)url successBlock:(Success)successBlock failBlock:(Fail)FailBlock
{
    
    AFHTTPRequestOperationManager *manager = [self baseHttpRquest];
    
     NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:urlStr parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
         NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        FailBlock(error);
    }];
}


@end























