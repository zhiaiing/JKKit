//
//  UIApplication+JKApplication.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Returns "Documents" folder in this app's sandbox.
NSString *NSDocumentsPath(void);

/// Returns "Library" folder in this app's sandbox.
NSString *NSLibraryPath(void);

/// Returns "Caches" folder in this app's sandbox.
NSString *NSCachesPath(void);

@interface UIApplication (JKApplication)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly,getter=jk_documentsURL) NSURL *documentsURL;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly, getter=jk_cachesURL) NSURL *cachesURL;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly, getter=jk_libraryURL) NSURL *libraryURL;

/// Application's Bundle Name (show in SpringBoard).
@property (nonatomic, readonly, getter=jk_appBundleName) NSString *appBundleName;

/// Application's Bundle ID.  e.g. "com.live Interactive.MyApp"
@property (nonatomic, readonly, getter=jk_appBundleID) NSString *appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nonatomic, readonly, getter=jk_appVersion) NSString *appVersion;

/// Application's Build number. e.g. "123"
@property (nonatomic, readonly, getter=jk_appBuildVersion) NSString *appBuildVersion;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryUsage) int64_t memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_cpuUsage) float cpuUsage;


/// App是否被破解了
/// Whether this app is priated (not from appstore).
@property (nonatomic, readonly, getter=jk_isPirated) BOOL isPirated;

/// App是否正在被调试
/// Whether this app is being debugged (debugger attached).
@property (nonatomic, readonly, getter=jk_isBeingDebugged) BOOL isBeingDebugged;

@end
