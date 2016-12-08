//
//  SettingViewController+tableViewProtocal.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/7.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingViewController+tableViewProtocal.h"

#import "UITableView+CommonFunction.h"

@implementation SettingViewController (tableViewProtocal)

#pragma mark - TableView Deleaget &Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SettingModel *model = (SettingModel *)[self.array objectAtIndex:section];
    return model.subItems.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingModel *model = (SettingModel *)[self.array objectAtIndex:indexPath.section];
    
    __weak typeof(self) weakSelf = self;
    
    return [tableView cellAtIndexPath:indexPath withObject:model andOwner:weakSelf];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
