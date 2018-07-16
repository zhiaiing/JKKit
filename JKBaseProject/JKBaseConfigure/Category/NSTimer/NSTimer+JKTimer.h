//
//  NSTimer+JKTimer.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerCallback)(NSTimer *timer);

@interface NSTimer (JKTimer)

+ (NSTimer *)jk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats callback:(TimerCallback)callback;

+ (NSTimer *)jk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval count:(NSInteger)count callback:(TimerCallback)callback;

/**
 暂停NSTimer
 */
- (void)pauseTimer;

/**
 开始NSTimer
 */
- (void)resumeTimer;

/**
 延迟开始NSTimer
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
