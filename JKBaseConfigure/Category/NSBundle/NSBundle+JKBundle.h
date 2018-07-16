//
//  NSBundle+JKBundle.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (JKBundle)

/**
 在bundle里查找指定文件，并返回完整文件路径。
 这里首先会根据屏幕的scale来搜索资源，例如iPhone5的@2x，如果搜索不到，则从最高分辨率@3x向下搜索。
 
 @param name       The name of a resource file contained in the directory
 specified by bundlePath.
 
 @param ext        If extension is an empty string or nil, the extension is
 assumed not to exist and the file is the first file encountered that exactly matches name.
 
 @param bundlePath The path of a top-level bundle directory. This must be a
 valid path. For example, to specify the bundle directory for a Mac app, you
 might specify the path /Applications/MyApp.app.
 
 @return The full pathname for the resource file or nil if the file could not be
 located. This method also returns nil if the bundle specified by the bundlePath
 parameter does not exist or is not a readable directory.
 */
+ (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath;

/**
 在bundle里查找指定文件，并返回完整文件路径。
 这里首先会根据屏幕的scale来搜索资源，例如iPhone5的@2x，如果搜索不到，则从最高分辨率@3x向下搜索。
 
 @param name       The name of the resource file. If name is an empty string or
 nil, returns the first file encountered of the supplied type.
 
 @param ext        If extension is an empty string or nil, the extension is
 assumed not to exist and the file is the first file encountered that exactly matches name.
 
 
 @return The full pathname for the resource file or nil if the file could not be located.
 */
- (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext;

/**
 在bundle里查找指定文件，并返回完整文件路径。
 这里首先会根据屏幕的scale来搜索资源，例如iPhone5的@2x，如果搜索不到，则从最高分辨率@3x向下搜索。
 
 @param name       The name of the resource file.
 
 @param ext        If extension is an empty string or nil, all the files in
 subpath and its subdirectories are returned. If an extension is provided the
 subdirectories are not searched.
 
 @param subpath   The name of the bundle subdirectory. Can be nil.
 
 @return An array of full pathnames for the subpath or nil if no files are located.
 */
- (NSString *)jk_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath;

@end
