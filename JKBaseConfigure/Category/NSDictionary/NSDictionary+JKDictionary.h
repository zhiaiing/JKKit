//
//  NSDictionary+JKDictionary.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_STATIC_INLINE BOOL NSDictionaryIsEmpty(NSDictionary *dictionary)
{
    if (dictionary && dictionary.count > 0 ) return NO;
    
    return YES;
}

@interface NSDictionary (JKDictionary)

/// 返回所有key (按字典序排列)
- (NSArray *)jk_allKeysSorted;

/// 返回所有value (按key的字典序排列)
- (NSArray *)jk_allValuesSortedByKeys;

/// 是否包含 key
- (BOOL)jk_containsObjectForKey:(id)key;

/// 根据一组 key 来取对象
- (NSDictionary *)jk_entriesForKeys:(NSArray *)keys;

/// 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
- (NSString *)jk_jsonStringEncoded;

/// 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
- (NSString *)jk_jsonPrettyStringEncoded;

/**
 尝试解析 XML，并包装为 dictionary。
 如果你只是想从一个小xml里取一个值，可以试试这个方法
 
 example XML: "<config><a href="test.com">link</a></config>"
 example Return: @{@"_name":@"config", @"a":{@"_text":@"link",@"href":@"test.com"}}
 
 @param xmlDataOrString XML in NSData or NSString format.
 
 @return Return a new dictionary, or nil if an error occurs.
 */
+ (NSDictionary *)jk_dictionaryWithXML:(id)xmlDataOrString;



@end
