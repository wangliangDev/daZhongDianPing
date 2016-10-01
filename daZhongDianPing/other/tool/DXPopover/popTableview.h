//
//  popTableview.h
//  testxxxxxx
//
//  Created by jinns on 16/4/21.
//  Copyright © 2016年 jinns. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol popTableViewDelegate <NSObject>

-(void)selectAtIndex:(NSInteger)index value:(NSString *)value;

@end

@interface popTableview : UIView<UITableViewDelegate,UITableViewDataSource>{
    
    
    UITableView *PopTableView;
    
    NSArray *titleArray;
    
    UILabel *lineLabel;
    
    UILabel *titleLabel;
    
    UIImageView *iconImageView;
    
    

    
}
@property(nonatomic,weak) id<popTableViewDelegate> delegate;
@property(nonatomic,strong)NSArray *imageArray;
-(id)initWithFrame:(CGRect)frame array:(NSArray *)array imageArray:(NSArray*)imageArray ;


@end





