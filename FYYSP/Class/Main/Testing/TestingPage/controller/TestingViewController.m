//
//  TestingViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "TestingViewController.h"

#import "ImageURLModel.h"

#import "ImageTestCollectionViewCell.h"

#import "UIImageView+WebCache.h"

#import "MJRefresh.h"


static NSString * const identify = @"IDentify_collectionCell";

@interface TestingViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation TestingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"测试";
    
    self.dataArray = [NSMutableArray arrayWithCapacity:20];
    
//    [self setupCollectionView];
    
//    [self.collectionView.mj_header beginRefreshing];
}

-(void)modelRequest{
    [ImageURLModel requestDataWith_ArrayBlock:^(NSArray *array, NSError *error) {
        if (!error) {
            [self.dataArray removeAllObjects];
            
            [self.dataArray addObjectsFromArray:array];
            
            [self.collectionView.mj_header endRefreshing];
            
            [self.collectionView reloadData];
        }
    }];
}

/**
 设置collectionView
 */
-(void)setupCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.itemSize = CGSizeMake(100, 100);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 100) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ImageTestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identify];
    
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(modelRequest)];
    
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollection代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageURLModel *model = (ImageURLModel *)[self.dataArray objectAtIndex:indexPath.row];
    
    ImageTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    
    return cell;
}

@end
