//
//  NSString+JKAdd.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JKAdd)

/// 计算字符串的绘制大小
- (CGSize)jk_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/// 计算字符串的绘制宽度 (单行)
- (CGFloat)jk_widthForFont:(UIFont *)font;

/// 计算字符串的绘制高度 (定宽)
- (CGFloat)jk_heightForFont:(UIFont *)font width:(CGFloat)width;

/// 计算字符串的绘制高度
/// @param width 最大宽度
/// @param maxLine 最大行数 (比如传入3，则字超过3行时，会截取3行的高度返回)
- (CGFloat)jk_heightForFont:(UIFont *)font width:(CGFloat)width line:(NSInteger)maxLine;











/// URL encode (UTF8)
- (NSString *)jk_stringByURLEncode;
/// URL decode (UTF8)
- (NSString *)jk_stringByURLDecode;

/// URL encode
- (NSString *)jk_stringByURLEncode:(NSStringEncoding)encoding;
/// URL decode
- (NSString *)jk_stringByURLDecode:(NSStringEncoding)encoding;

/// 将html字符转义。 例如将 '<' 转为 '&lt;'
- (NSString *)jk_stringByEscapingHTML;

























@end
