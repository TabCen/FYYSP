//
//  UFO.h
//  FundSale
//
//  Created by  chenfei on 16/8/26.
//  Copyright © 2016年 zsf. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  --------------------------------------        无敌工具类          --------------------------------
 */

@interface UFO : NSObject

/**
 *  时间格式修改(yyyy-MM-dd HH:mm:ss)
 *
 *  @param dataStr 要修改的字符串 20130219
 *  @param fromFor 原始格式（yyyyMMdd）
 *  @param toFor   最终格式（yyyy.MM.dd）
 *
 *  @return 返回的字符串      2013.02.19
 */
+(NSString *)dataString:(NSString *)dataStr FromFormater:(NSString *)fromFor toFor:(NSString *)toFor;



/**
 获取当前时刻的时间戳

 @return 时间戳字符串
 */
+(NSString *)timeStamp;


@end

/**
 *  ///////////////////////////////  时间格式转换  ///////////////////////////////
 */
@interface NSString (DateFormatter)


/**
 *  时间格式转换(yyyy-MM-dd HH:mm:ss)
 *
 *  @param fromFor yyyyMMdd
 *  @param toFor   yyyy.MM.dd
 *
 *  @return toFor 格式的字符串
 */

-(NSString *)dateFormatterFromFor:(NSString *)fromFor toFor:(NSString *)toFor;

@end






/**
 *  ///////////////////////////////  金额大些转换  ///////////////////////////////
 */
@interface NSString (CapitalLetters)

/**
 *  将金额数字字符串转化成汉子大写字符串
 *
 *  @return 汉字大写字符串
 */
-(NSString *)toCapitalLetters;

@end


/**
 *  ///////////////////////////////  常用转换  ///////////////////////////////
 */
@interface NSString (common)

/**
 去除字符串中的空格

 @param str 字符串带空格
 @return 不带空格
 */
+ (NSString *)trimSpacesOfString:(NSString *)str;

//字典转为Json字符串
+(NSString *)dictionaryToJson:(NSDictionary *)dic;

//判断NSString字符串是否包含emoji表情
-(BOOL)isContainEmoji:(NSString *)emojiStr;

@end


/**
 *  ///////////////////////////////  UILabel高度获取、行距设置  ///////////////////////////////
 */

@interface UILabel (utils)

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;


@end


/**
 *  ///////////////////////////////    ///////////////////////////////
 */


