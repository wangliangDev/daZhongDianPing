//
//  TTBBScrollViewButton.m
//  daZhongDianPing
//
//  Created by ttbb on 16/8/5.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "TTBBScrollViewButton.h"


#define BUTTONWIDTH 50
#define BUTTONHEIGHT 50



@implementation TTBBScrollViewButton



-(id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initScrollView];
    }
    
    return self;
}

-(void)setButtonDict:(NSDictionary *)buttonDict
{
    _buttonDict = buttonDict;
    
    
    NSArray * buttonArr = [buttonDict objectForKey:@"buttonImage"];
   
    NSArray *textArr = [buttonDict objectForKey:@"buttonText"];
    
    NSInteger pageNum =  buttonArr.count / 10;
    
    if (buttonArr.count % 10 != 0) {
        
        pageNum +=1;
    }
    
    ScrollView.contentSize = CGSizeMake(KSCREEN_WIDTH * pageNum, self.frame.size.height);
    
    
    leftSpace = (KSCREEN_WIDTH - BUTTONWIDTH * 5) / 10;
    topSpace = ((scrollViewHeight - 10)  - BUTTONHEIGHT * 2) / 4;
    
   
    
    if (buttonArr.count <= 8)
    {
        
        for (int i = 0; i < buttonArr.count; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:buttonArr[i]] forState:UIControlStateNormal];
            button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(i%5), topSpace +(2*topSpace + BUTTONHEIGHT)* (i/5), BUTTONWIDTH, BUTTONHEIGHT);
            button.tag = i;
            button.layer.cornerRadius = BUTTONHEIGHT / 2;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [ScrollView addSubview:button];
            
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:11];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(i%5), CGRectGetMaxY(button.frame)+5, BUTTONWIDTH, 20);
            label.text = textArr[i];
            [ScrollView addSubview:label];
            
            
        }
        
    }else if (buttonArr.count <= 16 && buttonArr.count > 8){
        
        for (int i = 0; i < buttonArr.count; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:buttonArr[i]] forState:UIControlStateNormal];
            button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(i%5), topSpace +(2*topSpace + BUTTONHEIGHT) * (i/5), BUTTONWIDTH, BUTTONHEIGHT);
            button.tag = i;
            button.layer.cornerRadius = BUTTONHEIGHT / 2;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [ScrollView addSubview:button];
            
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:11];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(i%5), CGRectGetMaxY(button.frame)+5, BUTTONWIDTH, 20);
            label.text = textArr[i];
            [ScrollView addSubview:label];
            
            
            
        }
        
        
        for (int j = 0; j < buttonArr.count - (pageNum -1)*10; j ++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:buttonArr[j+10 *(pageNum -1)]] forState:UIControlStateNormal];
            button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(j%5 + 5*(pageNum-1)), topSpace +(2*topSpace + BUTTONHEIGHT) * (j/5), BUTTONWIDTH, BUTTONHEIGHT);
            button.tag = j+10 *(pageNum -1);
            button.layer.cornerRadius = BUTTONHEIGHT / 2;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [ScrollView addSubview:button];
            
            
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:11];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(j%5 + 5*(pageNum-1)), CGRectGetMaxY(button.frame)+5, BUTTONWIDTH, 20);
            label.text = textArr[j+10 *(pageNum -1)];
            [ScrollView addSubview:label];
            
        }

    }else{
        
        for (int i = 0; i < 8; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
             [button setBackgroundImage:[UIImage imageNamed:buttonArr[i]] forState:UIControlStateNormal];
            button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(i%5), topSpace +(2*topSpace + BUTTONHEIGHT) * (i/5), BUTTONWIDTH, BUTTONHEIGHT);
            button.tag = i;
            button.layer.cornerRadius = BUTTONHEIGHT / 2;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [ScrollView addSubview:button];
            
        }
        
        
        for (int i = 1; i < pageNum -1; i ++)
        {
            
            for (int j = 0 ; j < 8; j ++)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundImage:[UIImage imageNamed:buttonArr[j+ 10*i]] forState:UIControlStateNormal];
                button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(j%5 + 5*i), topSpace +(2*topSpace + BUTTONHEIGHT) * (j/5), BUTTONWIDTH, BUTTONHEIGHT);
                button.tag = j+ 10*i;
                button.layer.cornerRadius = BUTTONHEIGHT / 2;
                [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                [ScrollView addSubview:button];
            }
            
            
        }
        
        
        for (int j = 0; j < buttonArr.count - (pageNum -1)*10; j ++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:buttonArr[j+10 *(pageNum -1)]] forState:UIControlStateNormal];
            button.frame = CGRectMake(leftSpace + (2*leftSpace + BUTTONWIDTH)*(j%5 + 5*(pageNum-1)), topSpace +(2*topSpace + BUTTONHEIGHT) * (j/5), BUTTONWIDTH, BUTTONHEIGHT);
            button.tag = j+10 *(pageNum -1);
            button.layer.cornerRadius = BUTTONHEIGHT / 2;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [ScrollView addSubview:button];
        }
 
    }

}


-(void)initScrollView
{
    
    if (self.frame.size.height == 0) {
        
        scrollViewHeight = 180;
    }else{
        
        scrollViewHeight = self.frame.size.height;
    }
    
    ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH,scrollViewHeight)];
    ScrollView.delegate = self;
    ScrollView.showsVerticalScrollIndicator = NO;
    ScrollView.showsHorizontalScrollIndicator = NO;
    ScrollView.pagingEnabled = YES;
    [self addSubview:ScrollView];
}

-(void)buttonAction:(UIButton*)button
{
    
    NSLog(@"buttonbutton---%ld",(long)button.tag);
}


@end












