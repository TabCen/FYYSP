//
//  URLSet.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#ifndef URLSet_h
#define URLSet_h

#define BaseURL @"https://app.gomefund.com"

#define Appending_URL(b) [NSString stringWithFormat:@"%@%@",BaseURL,b]

#define WS_URL Appending_URL(@"/fundApp/wandeRequest.json?")

#define FCL_URL Appending_URL(@"/fundApp/wandeRequest.json")

#define ImageURL @"http://112.124.22.238:8081/course_api/wares/hot"

#endif /* URLSet_h */
