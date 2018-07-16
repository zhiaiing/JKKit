//
//  NSFileManager+JKFileManager.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (JKFileManager)

+ (NSURL *)documentsURL;

+ (NSString *)documentsPath;

+ (NSURL *)libraryURL;

+ (NSString *)libraryPath;

+ (NSURL *)cachesURL;

+ (NSString *)cachesPath;

@end
