//
//  SettingViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingViewController.h"

#import "SettingTableViewCell.h"

#import "UIViewController+BaseExtension.h"

static NSString * const ID_Setting = @"Setting_Cell_ID";

@interface SettingViewController ()<UITableViewDelegate , UITableViewDataSource>

@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置回退按钮
    [self setBackButton:YES];
    
    self.navigationItem.title = @"设置";
    
    [self addTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Full_Width, Screen_Full_Height) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingTableViewCell" bundle:nil] forCellReuseIdentifier:ID_Setting];
    [self.view addSubview:_tableView];
    
    
    
}


#pragma mark - TableView Deleaget &Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID_Setting forIndexPath:indexPath];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
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
