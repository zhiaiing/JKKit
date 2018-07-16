//
//  NSObject+JKRuntime.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (JKRuntime)

/** 属性列表 */
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;
/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;


/** 成员变量列表 */
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;


/** 对象方法列表 */
-(NSArray*)instanceMethodList;
+(NSArray*)instanceMethodList;
/** 类方法列表 */
+(NSArray*)classMethodList;


/** 协议列表 */
-(NSDictionary *)protocolList;
+(NSDictionary *)protocolList;


/** 交换实例方法 */
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end
