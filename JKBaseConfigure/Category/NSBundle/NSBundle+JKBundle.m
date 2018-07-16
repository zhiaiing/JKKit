//
//  NSBundle+JKBundle.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "NSBundle+JKBundle.h"
#import "JKCategoryMacro.h"
#import "NSString+JKString.h"

#define SUPPORT_SCALES @[@3, @2, @1]

@implementation NSBundle (JKBundle)

+ (NSArray *)allScales {
    static NSMutableArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // first search screen's scale, then search from high to low.
        scales = SUPPORT_SCALES.mutableCopy;
        NSInteger screenScale = [UIScreen mainScreen].scale;
        [scales removeObject:@(screenScale)];
        [scales insertObject:@(screenScale) atIndex:0];
    });
    return scales;
}

+ (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext inDirectory:bundlePath];
    
    NSString *path = nil;
    
    // first search screen's scale, then search from high to low.
    NSArray *scales = [NSBundle allScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name jk_stringByAppendingNameScale:scale]
        : [name jk_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext inDirectory:bundlePath];
        if (path) break;
    }
    
    return path;
}

- (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext];
    
    NSString *path = nil;
    
    // first search screen's scale, then search from high to low.
    NSArray *scales = [NSBundle allScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name jk_stringByAppendingNameScale:scale]
        : [name jk_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext];
        if (path) break;
    }
    
    return path;
}

- (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext];
    
    NSString *path = nil;
    
    // first search screen's scale, then search from high to low.
    NSArray *scales = [NSBundle allScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name jk_stringByAppendingNameScale:scale]
        : [name jk_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext inDirectory:subpath];
        if (path) break;
    }
    
    return path;
}


@end
