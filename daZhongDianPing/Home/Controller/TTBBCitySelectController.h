//
//  TTBBCitySelectController.h
//  daZhongDianPing
//
//  Created by ttbb on 16/9/27.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^setCityButtonBlock)(NSString *cityName);

@interface TTBBCitySelectController : UIViewController{
    
    
}
@property(nonatomic,copy)setCityButtonBlock setCityButtonBlock;
@end



@interface cityModel : JSONModel{
    
    
}
@property(nonatomic,strong) NSString <Optional>*cityName;
@property(nonatomic,strong) NSString <Optional>*pingYin;
@end

