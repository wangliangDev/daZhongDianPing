//
//  webViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/14.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "webViewController.h"

#import "NetWorkRequestSingleton.h"


@interface webViewController ()<UIWebViewDelegate>{
    
    
}

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT)];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    webview.delegate = self;
    [self.view addSubview:webview];

//    [[NetWorkRequestSingleton sharedManager]getAdv:nil url:@"http://120.25.93.225:9090/CPSP-SER2/v1/message/get_message_list.json?date=&order_by=0&token=GJ4TKF2T0E4R0PQHG5WHUM5NUDLGA0" successBlock:^(id result) {
//        
//    } failBlock:^(NSString *error) {
//        
//    }];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[Singleton shareInstance] loadHudView:self.view];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
     [[Singleton shareInstance] stopHudView];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[Singleton shareInstance] stopHudView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
