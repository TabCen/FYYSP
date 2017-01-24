//
//  ReadingViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ReadingViewController.h"

#import "YYCache.h"

#import "Model_Fund.h"

#import "MJExtension.h"

@interface ReadingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *tableDataArray;

@end

@implementation ReadingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"阅读";
    
//    [self setupTableView];
    
    [self ModelRequest];
}

-(void)setupTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:_tableView];
}

#pragma mark - 私有方法

-(void)ModelRequest{
    [Model_Fund requestDataWith_IDBlock:^(id object, NSError *error) {
        if (!error) {
            if ([[object objectForKey:@"code"] isEqualToString:@"ETS-5BP0000"]) {
                NSArray *aray = [object objectForKey:@"returnList"];
                self.tableDataArray = [Model_Fund mj_objectArrayWithKeyValuesArray:aray];
                
                [self.tableView reloadData];
            }
        }
    }];
}

#pragma mark - TableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"funCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    Model_Fund *mode = (Model_Fund *)[self.tableDataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",mode.TITLE];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载

-(NSMutableArray *)tableDataArray{
    if (!_tableDataArray) {
        _tableDataArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _tableDataArray;
}



@end
