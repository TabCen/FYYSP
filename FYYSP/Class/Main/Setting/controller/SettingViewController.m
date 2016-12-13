//
//  SettingViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingViewController.h"

#import "SettingTableViewCell.h"

//#import "SettingArrowTableViewCell.h"

#import "UIViewController+BaseCategory.h"

#import "SettingViewController+tableViewProtocal.h"

//static NSString * const ID_Setting = @"Setting_Cell_ID";
//static NSString * const ID_SettingArrow = @"Setting_Cell_Arrow_ID";


@interface SettingViewController ()<CFTableViewCellDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self _setViewModel];
    
    //设置回退按钮
    [self setBackButton:YES];
    
    self.navigationItem.title = @"设置";
    
    NSLog(@"%@",kPath);
    
//    [self addTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;    //  去掉分割线

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"SettingTableViewCell" bundle:nil] forCellReuseIdentifier:ID_Setting];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"SettingArrowTableViewCell" bundle:nil] forCellReuseIdentifier:ID_SettingArrow];
    
    [self.view addSubview:_tableView];
    
}

#pragma mark - cell中按钮的点击事件
- (void)tableViewCell:(UITableViewCell *)tableViewCell didSelectSwitchButtonAtIndexPath:(NSIndexPath *)indexPath{
//    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
//    if ([path isEqual:indexPath]) {
//        SettingTableViewCell *cell = (SettingTableViewCell *)tableViewCell;
//        if (cell.switch_btn.on) {
//            [self showMessageAlertView];
//        }else{
    
//        }
//    }
    
}

#pragma mark - 设置viewMode

-(void)_setViewModel{
    self.array = [NSMutableArray arrayWithCapacity:20];
    _array = [SettingModel mj_objectArrayWithKeyValuesArray:[SettingModel settingModelArray]];
    
}

#pragma mark - 私有方法

-(void)showMessageAlertView{
    [self _showAlertViewWithTitle:@"提示" message:@"重启应用后生效" insureBtn:@"知道了" cancleBtn:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

