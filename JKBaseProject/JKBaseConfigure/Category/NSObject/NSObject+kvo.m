//
//  NSObject+kvo.m
//  messageSend
//
//  Created by 康 on 2018/5/11.
//  Copyright © 2018年 xiao. All rights reserved.
//

#import "NSObject+kvo.h"
#import <objc/message.h>

NSString *const JKKVOClassPrefix = @"JKKVO_";
NSString *const JKKVOAssociatedObservers = @"JKKVOAssociatedObservers";

@interface JKObservationInfo : NSObject

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) KangObservingBlock block;

@end


@implementation JKObservationInfo

- (instancetype)initWithObserver:(NSObject *)observer Key:(NSString *)key block:(KangObservingBlock)block{
    self = [super init];
    if (self) {
        _observer = observer;
        _key = key;
        _block = block;
    }
    return self;
}

@end


#pragma mark - Helpers
//通过set方法字符串获取 属性名称
static NSString * getterForSetter(NSString *setter){
    if (setter.length <=0 || ![setter hasPrefix:@"set"] || ![setter hasSuffix:@":"]) {
        return nil;
    }
    
    // remove 'set' at the begining and ':' at the end
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *key = [setter substringWithRange:range];
    
    // lower case the first letter
    NSString *firstLetter = [[key substringToIndex:1] lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                       withString:firstLetter];
    
    return key;
}

 //获取set方法的字符串
static NSString * setterForGetter(NSString *getter){
    if (getter.length <= 0) {
        return nil;
    }
    // upper case the first letter
    NSString *firstLetter = [[getter substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [getter substringFromIndex:1];
    
    // add 'set' at the begining and ':' at the end
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", firstLetter, remainingLetters];
    
    return setter;
}



@implementation NSObject (kvo)
- (void)PG_removeObserver:(NSObject *)observer forKey:(NSString *)key{
    NSMutableArray* observers = objc_getAssociatedObject(self, (__bridge const void *)(JKKVOAssociatedObservers));
    
    JKObservationInfo *infoToRemove;
    for (JKObservationInfo* info in observers) {
        if (info.observer == observer && [info.key isEqual:key]) {
            infoToRemove = info;
            break;
        }
    }
    
    [observers removeObject:infoToRemove];
}

- (BOOL)hasSelector:(SEL)selector{
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method* methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    
    free(methodList);
    return NO;
}

    
//    unsigned int methodCount = 0;
//    Ivar * ivars = class_copyIvarList(class_getSuperclass([self class]), &methodCount);
//
//
//    for (unsigned int i = 0; i < methodCount; i ++) {
//        Ivar ivar = ivars[i];
//        const char * name = ivar_getName(ivar);
//        const char * type = ivar_getTypeEncoding(ivar);
//        NSLog(@"Person拥有的成员变量的类型为%s，名字为 %s ",type, name);
//    }



- (void)jk_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context block:(KangObservingBlock )block{
    
    //获取set方法 标号
    SEL setterSelector = NSSelectorFromString(setterForGetter(keyPath));
    
    //获取set方法 实现
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    
    if(!setterMethod){//没有实现 说明没有改属性
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have a setter for key %@", self, keyPath];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        
        return;
    }
    
    Class clazz = object_getClass(self);
    //原类名
    NSString * oldClassName = NSStringFromClass([self class]);
    
    //新类名
    NSString * newClassName = [JKKVOClassPrefix stringByAppendingString:oldClassName];

    if (![oldClassName hasPrefix:JKKVOClassPrefix]) {
         clazz = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
        //注册该新类
        objc_registerClassPair(clazz);
        object_setClass(self, clazz);
    }

    //添加set方法
    if (![self hasSelector:setterSelector]) {
        //添加setterSelector
        const char *types = method_getTypeEncoding(setterMethod);
        class_addMethod(clazz, setterSelector, (IMP)kvo_setter, types);
    }
    
    JKObservationInfo *info = [[JKObservationInfo alloc] initWithObserver:observer Key:keyPath block:block];
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(JKKVOAssociatedObservers));
    if (!observers) {
        observers = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)(JKKVOAssociatedObservers), observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [observers addObject:info];
}


/**
 创建新的类

 @param superClassName 父类
 @return 新的类
 */
- (Class)creatNewClassWithSuperClassName:(NSString *)superClassName{
    
    NSString *kvoClazzName = [JKKVOClassPrefix stringByAppendingString:superClassName];
    Class clazz = NSClassFromString(kvoClazzName);
    
    if (clazz) {//内存里有该类，则表示已经创建过
        return clazz;
    }
    
    // class doesn't exist yet, make it
    Class superClass = NSClassFromString(superClassName);
    //新类 向申请内存空间
    Class kvoNewClass = objc_allocateClassPair(superClass, kvoClazzName.UTF8String, 0);
    
    //注册该新类
    objc_registerClassPair(kvoNewClass);
    
    return kvoNewClass;
}


/**
 监听值的变化

 @param self     谁要监听的
 @param _cmd     方法编号
 @param newValue 方法参数1
 */
static void kvo_setter(id self, SEL _cmd, id newValue){
    
    NSLog(@"😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁");
    
    NSString *setterName = NSStringFromSelector(_cmd);
    NSString *getterName = getterForSetter(setterName);
    
    if (!getterName) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    
    // 获取gettername对应的老的值
    id oldValue = [self valueForKey:getterName];
    
    SEL setSel = NSSelectorFromString(setterName);
    
    struct objc_super superclazz = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    
    //调用父类set方法
    ((void (*)(id, SEL , NSString*))objc_msgSendSuper)((__bridge id)(&superclazz), setSel, newValue);

     //look up observers and call the blocks
     //从数组中找到对应的观察者调用block
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(JKKVOAssociatedObservers));
    
    for (JKObservationInfo *each in observers) {
        if ([each.key isEqualToString:getterName]) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                each.block(self, getterName, oldValue, newValue);
            });
        }
    }
}

























































@end
