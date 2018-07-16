//
//  NSArray+JKArray.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "NSArray+JKArray.h"

@implementation NSArray (JKArray)

/**
 反转数组
 
 @return 完成反转的数组
 */
- (NSArray *)jk_reverseArray {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    return arrayTemp;
}

/**
 和 `objectAtIndex:` 类似，但超出范围不会抛异常
 
 @param index       index
 @return            id
 */
- (id)jk_objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

/**
 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
 
 @return NSString
 */
- (NSString *)jk_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

/**
 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
 
 @return NSString
 */
- (NSString *)jk_jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}



@end
