//
//  TTBBButton.m
//  daZhongDianPing
//
//  Created by jinns on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBButton.h"

@implementation TTBBButton


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}


/**
 *  设置button内部的image的范围
 *
 *  @param contentRect
 *
 *  @return image的范围
 */

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    
    return CGRectMake(0, 5, imageW, imageH);
}


/**
 *  设置button内部的title的范围
 *
 *  @param contentRect
 *
 *  @return title的范围
 */
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * 0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
    
}


@end
