//
//  UITableView+CommonFunction.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/6.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CommonFunction)

-(UITableViewCell *)cellAtIndexPath:(NSIndexPath *)indexPath withObject:(id)obj andOwner:(id)owner;

@end
