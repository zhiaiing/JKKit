//
//  UIControl+JKAdd.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "UIControl+JKAdd.h"
#import "JKCategoryMacro.h"
#import <objc/runtime.h>


static const int block_key;

@interface _JKUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, assign) UIControlEvents events;

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events;
- (void)invoke:(id)sender;

@end


@implementation _JKUIControlBlockTarget

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events {
    self = [super init];
    if (self) {
        self.block = block;
        self.events = events;
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end



@implementation UIControl (JKAdd)

- (void)jk_removeAllTargets {
    [[self allTargets] enumerateObjectsUsingBlock: ^(id object, BOOL *stop) {
        [self   removeTarget:object
                      action:NULL
            forControlEvents:UIControlEventAllEvents];
    }];
}

- (void)jk_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    NSSet *targets = [self allTargets];
    for (id currentTarget in targets) {
        NSArray *actions = [self actionsForTarget:currentTarget forControlEvent:controlEvents];
        for (NSString *currentAction in actions) {
            [self   removeTarget:currentTarget action:NSSelectorFromString(currentAction)
                forControlEvents:controlEvents];
        }
    }
    [self addTarget:target action:action forControlEvents:controlEvents];
}

- (void)jk_addBlockForControlEvents:(UIControlEvents)controlEvents
                              block:(void (^)(id sender))block {
    _JKUIControlBlockTarget *target = [[_JKUIControlBlockTarget alloc]
                                       initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _jk_allUIControlBlockTargets];
    [targets addObject:target];
}

- (void)jk_setBlockForControlEvents:(UIControlEvents)controlEvents
                              block:(void (^)(id sender))block {
    [self jk_removeAllBlocksForControlEvents:controlEvents];
    [self jk_addBlockForControlEvents:controlEvents block:block];
}

- (void)jk_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *targets = [self _jk_allUIControlBlockTargets];
    NSMutableArray *removes = [NSMutableArray array];
    [targets enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        _JKUIControlBlockTarget *target = (_JKUIControlBlockTarget *)obj;
        if (target.events == controlEvents) {
            [removes addObject:target];
            [self   removeTarget:target
                          action:@selector(invoke:)
                forControlEvents:controlEvents];
        }
    }];
    [targets removeObjectsInArray:removes];
}

- (NSMutableArray *)_jk_allUIControlBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}


@end
