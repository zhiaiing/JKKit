//
//  NSString+JKRegular.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//  正则验证

#import <Foundation/Foundation.h>

@interface NSString (JKRegular)


/**
 *  手机号码的有效性:分电信、联通、移动和小灵通
 */
- (BOOL)isMobileNumberClassification;
/**
 *  手机号有效性
 */
- (BOOL)isMobileNumber;

/**
 *  邮箱的有效性
 */
- (BOOL)isEmailAddress;

/**
 *  简单的身份证有效性
 *
 */
- (BOOL)simpleVerifyIdentityCardNum;

/**
 *  精确的身份证号码有效性检测
 *
 *  @param value 身份证号
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

/**
 *  车牌号的有效性
 */
- (BOOL)isCarNumber;

/**
 *  银行卡的有效性
 */
- (BOOL)bankCardluhmCheck;

/**
 *  IP地址有效性
 */
- (BOOL)isIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)isMacAddress;

/**
 *  网址有效性
 */
- (BOOL)isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)isValidChinese;

/**
 *  邮政编码
 */
- (BOOL)isValidPostalcode;

/**
 *  工商税号
 */
- (BOOL)isValidTaxNo;



/**
 去除html标签

 @return NSString
 */
- (NSString *)jk_stringByStrippingHTML;

/**
 清除js脚本

 @return NSString
 */
- (NSString *)jk_stringByRemovingScriptsAndStrippingHTML;

/**
 去除空格

 @return NSString
 */
- (NSString *)jk_trimmingWhitespace;

/**
 去除头尾空格与空行

 @return NSString
 */
- (NSString *)jk_trimmingWhitespaceAndNewlines;











/// 是否能匹配一个正则
- (BOOL)jk_matchesRegex:(NSString *)regex;

/// 遍历所有正则匹配
/// match 匹配的 subString
/// index 第几个匹配 (从0开始)
/// matchRange 匹配的 subString 的范围
/// stop 设置为NO则停止遍历
- (void)jk_enumerateRegexMatches:(NSString *)regex usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block;

- (void)jk_enumerateRegexMatches:(NSString *)regex caseInsensitive:(BOOL)caseIns usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block;

/// 查找并替换所有(正则)
- (NSString *)jk_stringByReplacingRegex:(NSString *)regex withString:(NSString *)replacement;
























@end
