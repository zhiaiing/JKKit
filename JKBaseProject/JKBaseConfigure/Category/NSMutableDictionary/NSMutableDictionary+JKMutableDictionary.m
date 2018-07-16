//
//  NSMutableDictionary+JKMutableDictionary.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "NSMutableDictionary+JKMutableDictionary.h"

@implementation NSMutableDictionary (JKMutableDictionary)

/**
 移除并返回一个对象
 */
- (id)jk_safeRemoveObjectForKey:(id)aKey{
    if (!aKey) return nil;
    id value = self[aKey];
    [self removeObjectForKey:aKey];
    return value;
}


/**
 移除并返回一组对象
 */
- (NSDictionary *)jk_safeRemoveEntriesForKeys:(NSArray *)keys{
    NSMutableDictionary *dic = @{}.mutableCopy;
    for (id key in keys) {
        id value = self[key];
        if (value) {
            [self removeObjectForKey:key];
            dic[key] = value;
        }
    }
    return dic;
}

@end
