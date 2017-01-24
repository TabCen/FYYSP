//
//  ImageURLModel.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/9.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseModel.h"

@interface ImageURLModel : BaseModel

@property(nonatomic,copy)NSString *idNum;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *imgUrl;

@property(nonatomic,copy)NSString *price;

@property(nonatomic,copy)NSString *sale;

@end
