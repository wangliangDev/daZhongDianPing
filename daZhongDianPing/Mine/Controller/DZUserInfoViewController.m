//
//  DZUserInfoViewController.m
//  daZhongDianPing
//
//  Created by ttbb on 16/9/26.
//  Copyright © 2016年 ttbb. All rights reserved.
//

#import "DZUserInfoViewController.h"
#import "normalCell.h"

#define NORMALCELL @"NORMALCELL"

@interface DZUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>{
    
    
    NSArray *section1;
    NSArray *section2;
    NSArray *section3;

}

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UILabel *logoutLabel;
@property(nonatomic,strong) UIImageView *iconImageView;
@end




@implementation DZUserInfoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObject];
    self.view.backgroundColor = kWhiteColor;
    self.title = @"个人信息";
    [self.view addSubview:self.tableView];
}

-(void)viewWillAppear:(BOOL)animated
{
   
    

}

-(void)initObject{
    
    section1 = @[@"昵称",@"性别",@"生日",@"家乡",@"常居地",@"收货地址",@"婚姻状态"];
    section2 = @[@"我的等级",@"会员身份"];
    section3 = @[@"手机号",@"密码",@"第三方账号绑定"];
}
-(UITableView*)tableView
{
    if (!_tableView)
    {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[normalCell class] forCellReuseIdentifier:NORMALCELL];
        
    }
    
    return _tableView;
}
-(UILabel*)logoutLabel
{
    if (!_logoutLabel)
    {
        _logoutLabel = [UILabel new];
        _logoutLabel.font = kFont(15);
        _logoutLabel.textColor = kTextColor;
        _logoutLabel.frame = CGRectMake(KSCREEN_WIDTH * 0.1, 0,KSCREEN_WIDTH * 0.8, 44);
        _logoutLabel.textAlignment = NSTextAlignmentCenter;
        _logoutLabel.text = @"退出登录";
    }
    
    return _logoutLabel;
}

-(UIImageView*)iconImageView
{
    
    
    if (!_iconImageView) {
        UserInfoModel *model = [[UserInfoManager shardManager]getUserInfo];
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
        _iconImageView.layer.cornerRadius = _iconImageView.frame.size.width / 2;
        
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.userIconUrl] placeholderImage:[UIImage imageNamed:@""]];
    }
    
    return _iconImageView;
}

#pragma mark --UITableViewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     UITableViewCell *theCell = nil;
    
    if (indexPath.section == 0) {
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.contentView addSubview:self.iconImageView];
        theCell = cell;
        
    }else if (indexPath.section == 1){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.title = section1[indexPath.row];
        theCell = cell;
        
    }else if (indexPath.section == 2){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.title = section2[indexPath.row];
        theCell = cell;
        
    }else if (indexPath.section == 3){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.title = section3[indexPath.row];
        theCell = cell;
        
    }else if (indexPath.section == 4){
        
        normalCell *cell = [[normalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
       
       
        [cell.contentView addSubview:self.logoutLabel];
        
        theCell = cell;
        
    }
    
   
    
    return theCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        return 65;
        
    }else{
        
        return 44;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section ==1){
        
        return section1.count;
        
    }else if (section == 2){
        
        return section2.count;
        
    }else if(section == 3) {
        
        return section3.count;
        
    }else{
        
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if (section == 0 ) {
        
        return 0;
        
    }else{
        
        return 10;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 4)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否退出当前用户" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1)
    {
        
        [[UserInfoManager shardManager] logOut];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end













