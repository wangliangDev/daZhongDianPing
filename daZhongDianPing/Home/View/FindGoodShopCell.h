//
//  FindGoodShopCell.h
//  daZhongDianPing
//
//  Created by ttbb on 2016/10/13.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^allGoodShopBlock)();
typedef void(^typeActionBlock)(UIButton *button);
@interface FindGoodShopCell : UITableViewCell{
    
    
}
@property(nonatomic,strong)NSDictionary *contentDict;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)allGoodShopBlock allGoodShopBlock;
@property(nonatomic,strong)typeActionBlock typeActionBlock;
@end
