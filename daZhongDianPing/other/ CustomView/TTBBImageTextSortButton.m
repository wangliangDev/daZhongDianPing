//
//  TTBBImageTextSortButton.m
//  daZhongDianPing
//
//  Created by apple on 2016/11/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBImageTextSortButton.h"

@implementation TTBBImageTextSortButton


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.spacing = 10.0;
        self.imageSize = CGSizeZero;
        
    }
    
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (CGSizeEqualToSize(CGSizeZero, self.imageSize)) //判断图片是否有赋值
    {
        [self.imageView sizeToFit];
        
    }else{
        
        CGPoint point = self.imageView.frame.origin;
        
        self.imageView.frame = CGRectMake(point.x, point.y, self.imageSize.width, self.imageSize.height);
    }
    
    [self.titleLabel sizeToFit];
    
    switch (self.buttonStyle) {
        case buttonStyleImageDwonTextUp:
            
            [self sortVerticalUpView:self.titleLabel downView:self.imageView];
            
            break;
        case buttonStyleImageUpTextDwon:
            
             [self sortVerticalUpView:self.imageView downView:self.titleLabel];
            
            break;
            
        case buttonStyleImageLeftTextRight:
            
            [self sortHorizontalLeftView:self.imageView rightView:self.titleLabel];
            
            break;
            
        case buttonStyleImageRightTextLeft:
            
             [self sortHorizontalLeftView:self.titleLabel rightView:self.imageView];
            
            break;
        default:
            break;
    }
}


-(void)sortHorizontalLeftView:(UIView*)leftView rightView:(UIView*)rightView
{
    
    CGRect leftViewFrame = leftView.frame;
    CGRect rightViewFrame = rightView.frame;
    
    CGFloat totalWidth = leftViewFrame.size.width + self.spacing + rightViewFrame.size.width;
    
    leftViewFrame.origin.x = (self.frame.size.width - totalWidth)/ 2;
    leftViewFrame.origin.y = (self.frame.size.height - leftView.frame.size.height) /2 ;
    leftView.frame = leftViewFrame;
    
    rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame) + self.spacing;
    rightViewFrame.origin.y = (self.frame.size.height - rightView.frame.size.height) /2 ;
    rightView.frame = rightViewFrame;
    
}


-(void)sortVerticalUpView:(UIView*)upView downView:(UIView*)downView
{
    
    CGRect upViewFrame = upView.frame;
    CGRect downViewFrame = downView.frame;
    
    CGFloat totalHeight = upView.frame.size.height + self.spacing + downView.frame.size.height;
    
    upViewFrame.origin.y = (self.frame.size.height - totalHeight) /2;
    upViewFrame.origin.x = (self.frame.size.width - upView.frame.size.width) /2;
    upView.frame = upViewFrame;
    
    downViewFrame.origin.y = CGRectGetMaxY(upView.frame) + self.spacing;
    downViewFrame.origin.x =  (self.frame.size.width - downView.frame.size.width) /2;
    downView.frame = downViewFrame;
    
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self setNeedsLayout];
    
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self setNeedsLayout];
}

-(void)setSpacing:(CGFloat)spacing
{
    _spacing = spacing;
    
    [self setNeedsLayout];
}


-(void)setImageSize:(CGSize)imageSize
{
    _imageSize = imageSize;
    
    [self setNeedsLayout];
}

@end






















