//
//  KeyChainWrapper.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/1.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Security/Security.h>

@interface CFKeyChainWrapper : NSObject

@property (nonatomic, strong) NSMutableDictionary *keychainData;
@property (nonatomic, strong) NSMutableDictionary *genericPasswordQuery;

- (void)mySetObject:(id)inObject forKey:(id)key;

- (id)myObjectForKey:(id)key;

- (void)resetKeychainItem;



@end
