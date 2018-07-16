//
//  UIDevice+JKAdd.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <mach/host_info.h>

typedef void (^ cameraAuthorziedBlock) (void);


@interface UIDevice (JKAdd)



/// Whether the device is iPad/iPad mini.
@property (nonatomic, readonly, getter=jk_isPad) BOOL isPad;

/// Whether the device is a simulator.
@property (nonatomic, readonly, getter=jk_isSimulator) BOOL isSimulator;

/// Wherher the device can make phone calls.
@property (nonatomic, readonly, getter=jk_canMakePhoneCalls) BOOL canMakePhoneCalls;

/// The device's machine model.  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nonatomic, readonly, getter=jk_machineModel) NSString *machineModel;

/// The device's machine model name. e.g. "iPhone 5s" "iPad mini 2"
/// @see http://theiphonewiki.com/wiki/Models
@property (nonatomic, readonly, getter=jk_machineModelName) NSString *machineModelName;

/// 屏幕大小，高大于宽
+ (CGSize) jk_screenSize;

/// 系统版本，以float形式返回
- (CGFloat)jk_systemVersionByFloat;

/// 系统版本，以float形式返回
+ (CGFloat)jk_systemVersionByFloat;

#pragma mark - Disk Space
///=============================================================================
/// @name Disk Space
///=============================================================================

/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_diskSpace) int64_t diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_diskSpaceFree) int64_t diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_diskSpaceUsed) int64_t diskSpaceUsed;


#pragma mark - Memory Information
///=============================================================================
/// @name Memory Information
///=============================================================================

/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryTotal) int64_t memoryTotal;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryUsed) int64_t memoryUsed;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryFree) int64_t memoryFree;

/// Acvite memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryActive) int64_t memoryActive;

/// Inactive memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryInactive) int64_t memoryInactive;

/// Wired memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryWired) int64_t memoryWired;

/// Purgable memory in byte. (-1 when error occurs)
@property (nonatomic, readonly, getter=jk_memoryPurgable) int64_t memoryPurgable;

@property (nonatomic,copy ,readonly, getter=jk_CPUType) NSString *CPUType;
@property (nonatomic,copy ,readonly, getter=jk_CPUSubtype) NSString *CPUSubtype;


#pragma mark - System version compare
///=============================================================================
/// @name System version compare
///=============================================================================

- (BOOL)jk_systemVersionLowerThan:(NSString*)version;
- (BOOL)jk_systemVersionNotHigherThan:(NSString *)version;
- (BOOL)jk_systemVersionHigherThan:(NSString*)version;
- (BOOL)jk_systemVersionNotLowerThan:(NSString *)version;

#pragma mark - Others
///=============================================================================
/// @name Others
///=============================================================================

/// 设备是否越狱
/// Whether the device is jailbroken.
@property (nonatomic, readonly, getter=jk_isJailbroken) BOOL isJailbroken;

//
+ (void)jk_cameraAuthorzied:(cameraAuthorziedBlock)authorizedBlock notAuthorized:(cameraAuthorziedBlock)notAuthorizedlock;

- (NSString*)jk_deviceID;





@end
