//
//  SettingViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingViewController.h"

#import "SettingTableViewCell.h"

#import "SettingArrowTableViewCell.h"

#import "UIViewController+BaseCategory.h"

#import "CFFileManager.h"

#import "SettingModel.h"

#import "SubItemsModel.h"

#import "UITableView+CommonFunction.h"

static NSString * const ID_Setting = @"Setting_Cell_ID";
static NSString * const ID_SettingArrow = @"Setting_Cell_Arrow_ID";


@interface SettingViewController ()<CFTableViewCellDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self _setViewModel];
    
    //设置回退按钮
    [self setBackButton:YES];
    
    self.navigationItem.title = @"设置";
    
    [self addTableView];
}

-(void)addTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;    //  去掉分割线
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingTableViewCell" bundle:nil] forCellReuseIdentifier:ID_Setting];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingArrowTableViewCell" bundle:nil] forCellReuseIdentifier:ID_SettingArrow];
    
    [self.view addSubview:_tableView];
    
}

#pragma mark - TableView Deleaget &Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SettingModel *model = (SettingModel *)[self.array objectAtIndex:section];
    if (model.btnType == SettingCellType_Switch) {
        return model.value?(model.subItems.count + 1):1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingModel *model = (SettingModel *)[self.array objectAtIndex:indexPath.section];
    
    switch (model.btnType) {
        case SettingCellType_Switch:{
            SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID_Setting forIndexPath:indexPath];
            cell.label_tittle.text = [NSString stringWithFormat:@"%@",model.tittle];
            cell.label_introduce.text = [NSString stringWithFormat:@"%@",model.introduce];
            cell.delegate = self;
            cell.indexPath = indexPath;
            
            return cell;
        }break;
        case SettingCellType_Choose:{
//            SettingModel *model = (SettingModel *)obj;
//            SubItemsModel *subModel = (SubItemsModel*)[model.subItems objectAtIndex:0];
//            SettingArrowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID_SettingArrow forIndexPath:indexPath];
//            cell.label_tittle.text = [NSString stringWithFormat:@"%@",subModel.tittle];
//            cell.textField_introduce.text = [NSString stringWithFormat:@"%@",subModel.value];
            UITableViewCell *cell = [[UITableViewCell alloc]init];
            return cell;
        }break;
        default:{
            UITableViewCell *cell = [[UITableViewCell alloc]init];
            return cell;
        }
            break;
    }
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

@end

