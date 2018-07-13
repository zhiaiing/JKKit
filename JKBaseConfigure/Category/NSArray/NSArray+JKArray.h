//
//  NSArray+JKArray.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JKArray)

/**
 反转数组
 
 @return 完成反转的数组
 */
- (NSArray *)jk_reverseArray;

/**
 和 `objectAtIndex:` 类似，但超出范围不会抛异常

 @param index       index
 @return            id
 */
- (id)jk_objectOrNilAtIndex:(NSUInteger)index;

/**
 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray

 @return NSString
 */
- (NSString *)jk_jsonStringEncoded;



/**
 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray

 @return NSString
 */
- (NSString *)jk_jsonPrettyStringEncoded;

@end
