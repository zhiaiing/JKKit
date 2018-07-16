//
//  NSDate+JKUpdateDate.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//  日期修改

#import <Foundation/Foundation.h>

@interface NSDate (JKUpdateDate)

- (NSDate *)jk_dateByAddingYears:(NSInteger)years; /// 从这个日期加上N年
- (NSDate *)jk_dateByAddingMonths:(NSInteger)months; /// 从这个日期加上N月
- (NSDate *)jk_dateByAddingWeeks:(NSInteger)weeks; /// 从这个日期加上N日
- (NSDate *)jk_dateByAddingDays:(NSInteger)days; /// 从这个日期加上N天
- (NSDate *)jk_dateByAddingHours:(NSInteger)hours; /// 从这个日期加上N小时
- (NSDate *)jk_dateByAddingMinutes:(NSInteger)minutes; /// 从这个日期加上N分钟
- (NSDate *)jk_dateByAddingSeconds:(NSInteger)seconds; /// 从这个日期加上N秒

@end
