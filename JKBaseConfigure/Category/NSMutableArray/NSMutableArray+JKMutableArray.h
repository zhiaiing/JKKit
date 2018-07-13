//
//  NSMutableArray+JKMutableArray.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JKMutableArray)

/// 移除第一个对象 (如果Array空，则无效果)
- (void)jk_safeRemoveFirstObject;

/// 移除最后一个对象 (如果Array空，则无效果)
- (void)jk_safeRemoveLastObject;




/// 在结尾添加对象 (为nil无效)
- (void)jk_safeAddObject:(id)anObject;

/// 在开头添加对象 (为nil无效)
- (void)jk_safeAddToFirstObject:(id)anObject;

/// 在结尾添加一批对象 (可以为nil)
- (void)jk_safeAppendObjects:(NSArray *)objects;

/// 在开头添加一批对象 (可以为nil)
- (void)jk_safeAddToFirstObjects:(NSArray *)objects;

/// 在某个位置添加一批对象 (index不能超出范围)
- (void)jk_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

/// 反转对象顺序，例如 @[ @1, @2, @3 ] -> @[ @3, @2, @1 ].
- (void)jk_reverse;

/// 随机排列对象顺序 (洗牌)
- (void)jk_shuffle;


@end
