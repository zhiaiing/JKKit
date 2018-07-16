//
//  NSString+JKEmoji.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//  16进制 转 Emoji 的处理

#import <Foundation/Foundation.h>

@interface NSString (JKEmoji)

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)jk_emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)jk_emojiWithStringCode:(NSString *)stringCode;

- (NSString *)jk_emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)jk_isEmoji;


/**
 是否包含emoji字符
 */
- (BOOL)jk_isContainsEmoji:(NSString *)string;


@end
