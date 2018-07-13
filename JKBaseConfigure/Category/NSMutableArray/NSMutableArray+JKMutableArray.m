//
//  NSMutableArray+JKMutableArray.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "NSMutableArray+JKMutableArray.h"

@implementation NSMutableArray (JKMutableArray)


/**
 移除第一个对象 (如果Array空，则无效果)
 */
- (void)jk_safeRemoveFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
/**
 移除最后一个对象 (如果Array空，则无效果)
 */
- (void)jk_safeRemoveLastObject {
    if (self.count) {
        [self removeLastObject];
    }
}
#pragma clang diagnostic pop


/*
 在结尾添加对象 (为nil无效)
 */
- (void)jk_safeAddObject:(id)anObject {
    if(anObject){
        [self addObject:anObject];
    }
}

/*
 在开头添加对象 (为nil无效)
 */
- (void)jk_safeAddToFirstObject:(id)anObject {
    
    if (anObject) {
        [self insertObject:anObject atIndex:0];
    }
}

/*
 在结尾添加一批对象 (可以为nil)
 */
- (void)jk_safeAppendObjects:(NSArray *)objects {
    if (!objects) return;
    [self addObjectsFromArray:objects];
}

/*
 在开头添加一批对象 (可以为nil)
 */
- (void)jk_safeAddToFirstObjects:(NSArray *)objects {
    if (!objects) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        if (obj) {
            [self insertObject:obj atIndex:i++];
        }
    }
}

/**
 在某个位置添加一批对象 (index不能超出范围)
 */
- (void)jk_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

/**
 反转对象顺序
 */
- (void)jk_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

/**
 随机顺序
 */
- (void)jk_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}




@end
