//
//  UFO.m
//  FundSale
//
//  Created by  chenfei on 16/8/26.
//  Copyright © 2016年 zsf. All rights reserved.
//

#import "UFO.h"


//static NSString *const FORMATTER_yyMMdd =@"yyyyMMdd";

//static NSString *const FORMATTER_yyMMdd =@"yyyy.MM.dd";

@implementation UFO

+(NSString *)dataString:(NSString *)dataStr FromFormater:(NSString *)fromFor toFor:(NSString *)toFor{
    return [dataStr dateFormatterFromFor:fromFor toFor:toFor];
}

+(NSString *)timeStamp{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    
    return [NSString stringWithFormat:@"%llu",recordTime];
}


@end

@implementation NSString (DateFormatter)

-(NSString *)dateFormatterFromFor:(NSString *)fromFor toFor:(NSString *)toFor{
    //日期格式转换
    NSDateFormatter *dataFormatter=[[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:fromFor];
    NSDate *data=[dataFormatter dateFromString:self];
    
    NSDateFormatter *toDataFormatter=[[NSDateFormatter alloc]init];
    [toDataFormatter setDateFormat:toFor];
    
    return  [toDataFormatter stringFromDate:data];
}

@end

@implementation NSString (CapitalLetters)

-(NSString *)toCapitalLetters{
    return [self toCapitalLetters:self];
}

-(NSString *)toCapitalLetters:(NSString *)money
{
    NSMutableString *moneyStr=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%.2f",[money doubleValue]]];
    
    NSArray *MyScale2=@[@"元", @"拾", @"佰", @"仟", @"万", @"拾", @"佰", @"仟", @"亿", @"拾", @"佰", @"仟", @"兆", @"拾", @"佰", @"仟" ];
    
//    NSArray *MyScale=@[@"分", @"角", @"元", @"拾", @"佰", @"仟", @"万", @"拾", @"佰", @"仟", @"亿", @"拾", @"佰", @"仟", @"兆", @"拾", @"佰", @"仟" ];
    
    NSArray *MyScale1=@[@"分",@"角"];
    
    NSArray *MyBase=@[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
    
//    NSArray *sub=@[@"万",@"亿"];
    
    NSMutableString *M=[[NSMutableString alloc] init];
    
    bool zero=NO;
    
    //    [moneyStr deleteCharactersInRange:NSMakeRange([moneyStr rangeOfString:@"."].location, 1)];
    
    NSArray *temarr = [moneyStr componentsSeparatedByString:@"."];
    
    NSString *firstStr=[NSString stringWithFormat:@"%@",temarr[0]];
    
    NSString *secondStr=[NSString stringWithFormat:@"%@",temarr[1]];
    
    for(int i=(int)firstStr.length;i>0;i--)
    {
        //取最高位数
        NSInteger MyData=[[firstStr substringWithRange:NSMakeRange(firstStr.length-i, 1)] integerValue];
        
        if ([MyBase[MyData] isEqualToString:@"零"]) {
            
            if ([MyScale2[i-1] isEqualToString:@"万"]||[MyScale2[i-1] isEqualToString:@"亿"]||[MyScale2[i-1] isEqualToString:@"元"]) {
                //去除有“零万”
                if (zero) {
                    M =[NSMutableString stringWithFormat:@"%@",[M substringToIndex:(M.length-1)]];
                    [M appendString:MyScale2[i-1]];
                    zero=NO;
                }else{
                    [M appendString:MyScale2[i-1]];
                    zero=NO;
                }
                
                //去除有“亿万”的情况
                if ([MyScale2[i-1] isEqualToString:@"万"]) {
                    if ([[M substringWithRange:NSMakeRange(M.length-2, 1)] isEqualToString:@"亿"]) {
                        M =[NSMutableString stringWithFormat:@"%@",[M substringToIndex:M.length-1]];
                    }
                }
                
            }else{
                if (!zero) {
                    [M appendString:MyBase[MyData]];
                    zero=YES;
                }
                
            }
            
        }else{
            [M appendString:MyBase[MyData]];
            [M appendString:MyScale2[i-1]];
            zero=NO;
        }
        
    }
    
//        小数点后
        if ([secondStr isEqualToString:@"00"]) {
            [M appendString:@"整"];
        }else{
            for(int i=(int)secondStr.length;i>0;i--)
            {
                //取最高位数
                NSInteger MyData=[[secondStr substringWithRange:NSMakeRange(secondStr.length-i, 1)] integerValue];
    
                [M appendString:MyBase[MyData]];
                [M appendString:MyScale1[i-1]];
            }
        }
    
    return M;
}

@end


@implementation UILabel (utils)

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}


+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, MAXFLOAT)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    [label setText:text lineSpacing:lineSpacing];
    [label sizeToFit];
    
    return label.frame.size.height;
}

@end
