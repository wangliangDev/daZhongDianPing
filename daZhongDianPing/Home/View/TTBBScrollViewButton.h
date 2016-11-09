//
//  TTBBScrollViewButton.h
//  daZhongDianPing
//
//  Created by ttbb on 16/8/5.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^typeSelect)(UIButton*button);

@interface TTBBScrollViewButton : UIView<UIScrollViewDelegate>{
    
   
    UIScrollView * ScrollView;
    float leftSpace;
    float topSpace;
    NSInteger scrollViewHeight;
}
@property(nonatomic,strong)NSDictionary *buttonDict;
@property(nonatomic,strong)typeSelect typeSelectBlock;

@end
