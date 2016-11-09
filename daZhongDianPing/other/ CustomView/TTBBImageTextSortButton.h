//
//  TTBBImageTextSortButton.h
//  daZhongDianPing
//
//  Created by apple on 2016/11/8.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , buttonStyle) {
    
    buttonStyleImageUpTextDwon,
    buttonStyleImageDwonTextUp,
    buttonStyleImageLeftTextRight,
    buttonStyleImageRightTextLeft
};



@interface TTBBImageTextSortButton : UIButton{
    
    
    
}
@property(nonatomic,assign)buttonStyle buttonStyle;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,assign)CGSize imageSize;

@end
