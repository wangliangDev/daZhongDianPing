//
//  TTBBTabbarController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/4.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBTabbarController.h"
//#import "TTBBButton.h"



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





@interface TTBBTabbarController (){
    
    UIImageView *tabbarImageView;
    TTBBButton *preButton;

}

@end



@implementation TTBBTabbarController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
    }
    
    return self;
}

-(void)viewDidLoad
{
    
    tabbarImageView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    
    tabbarImageView.userInteractionEnabled = YES;
    
    tabbarImageView.backgroundColor = [UIColor whiteColor];
    
    [self.tabBar addSubview:tabbarImageView];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    for (UIView *view in self.tabBar.subviews) {
        
        if (view != tabbarImageView) {
            
            [view removeFromSuperview];
        }
    }
}

-(void)setItemArray:(NSArray *)itemArray
{
    _itemArray = itemArray;
    self.viewControllers = itemArray;
    
    TTBBButton * button = tabbarImageView.subviews[0];
    [self changeViewController:button];
}

-(void)setButtonCount:(int)buttonCount
{
    _buttonCount = buttonCount;
    
}
-(void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    _titleNormalColor = titleNormalColor;
}

-(void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    _titleSelectedColor = titleSelectedColor;
}

-(void)setTabbarBgColor:(UIColor *)tabbarBgColor
{
    
    _tabbarBgColor = tabbarBgColor;
    tabbarImageView.backgroundColor = tabbarBgColor;
    
}
//#pragma mark 创建一个按钮

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    
    TTBBButton * customButton = [TTBBButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = index;
    
    CGFloat buttonW = tabbarImageView.frame.size.width / _buttonCount;
    CGFloat buttonH = tabbarImageView.frame.size.height;
    
    customButton.frame = CGRectMake(buttonW * index, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    [customButton setTitle:title forState:UIControlStateNormal];
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [customButton setTitleColor:_titleNormalColor forState:UIControlStateNormal];
    [customButton setTitleColor:_titleSelectedColor forState:UIControlStateSelected];
    [customButton setTitleColor:_titleNormalColor forState:UIControlStateDisabled];
    
    [tabbarImageView addSubview:customButton];
    
    if(index == 0)//设置第一个选择项。（默认选择项）
    {
        preButton = customButton;
        preButton.selected = YES;
    }
    
}

// 按钮被点击时调用
- (void)changeViewController:(TTBBButton *)sender
{
    if(self.selectedIndex != sender.tag){
        
        self.selectedIndex = sender.tag; //切换不同控制器的界面
        preButton.selected = ! preButton.selected;
        preButton = sender;
        preButton.selected = YES;
    }
}


@end




















