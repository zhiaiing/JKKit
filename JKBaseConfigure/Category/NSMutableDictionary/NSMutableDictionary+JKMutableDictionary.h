//
//  NSMutableDictionary+JKMutableDictionary.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JKMutableDictionary)

/**
 移除并返回一个对象
 */
- (id)jk_safeRemoveObjectForKey:(id)aKey;


/**
 移除并返回一组对象
 */
- (NSDictionary *)jk_safeRemoveEntriesForKeys:(NSArray *)keys;

@end
