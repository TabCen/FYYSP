//
//  SegmentViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SegmentViewController.h"
#import "UIScrollView+CommonFunction.h"

@interface SegmentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试截屏";
    
    //设置回退按钮的样式统一
    [self setBackButton:YES];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"IDENTIFY"];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDENTIFY" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        UIImage *image = [tableView imageOfPrintScreen];
//        UIImage *image = [self imageFromNav];
        UIImage *image = [self imageFromTableView];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

-(UIImage *)imageFromNav{
    
    UIImage* image = nil;
    
    CGSize navSize = CGSizeMake(kScreenWidth, 64);
    
    UIGraphicsBeginImageContextWithOptions(navSize, NO, 0.0);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        UIRectClip(CGRectMake(0, 0, kScreenWidth, 64));
        [self.navigationController.view.layer renderInContext:context];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    if (image != nil) {
        return image;
    }
    return nil;
}

-(UIImage *)imageFromTableView{
    UIImage *headImage = [self imageFromNav];
    UIImage *tabImage = [self.tableView imageOfPrintScreen];
    
    UIImage *image = nil;
    
    CGSize size = CGSizeMake(self.tableView.frame.size.width, self.tableView.contentSize.height+64);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    {
        [headImage drawInRect:CGRectMake(0, 0, size.width, 64)];
        [tabImage drawInRect:CGRectMake(0, 64, size.width, size.height-64)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}




@end
