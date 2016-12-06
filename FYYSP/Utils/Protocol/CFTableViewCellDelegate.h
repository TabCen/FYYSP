//
//  CFTableViewCellDelegate.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CFTableViewCellDelegate <NSObject>

@optional

- (void)tableViewCell:(UITableViewCell *)tableViewCell didSelectSwitchButtonAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableViewCell:(UITableViewCell *)tableViewCell didClickedButtonAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol CFCollectionViewCellDelegate <NSObject>

- (void)collectionViewCell:(UICollectionViewCell *)tableViewCell didClickedButtonAtIndexPath:(NSIndexPath *)indexPath;

@end
