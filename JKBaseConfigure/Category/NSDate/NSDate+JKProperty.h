//
//  NSDate+JKProperty.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//  属性

#import <Foundation/Foundation.h>

@interface NSDate (JKProperty)

@property (nonatomic, readonly) NSInteger jk_year; ///< Year component
@property (nonatomic, readonly) NSInteger jk_month; ///< Month component
@property (nonatomic, readonly) NSInteger jk_day; ///< Day component
@property (nonatomic, readonly) NSInteger jk_hour; ///< Hour component
@property (nonatomic, readonly) NSInteger jk_minute; ///< Minute component
@property (nonatomic, readonly) NSInteger jk_second; ///< Second component
@property (nonatomic, readonly) NSInteger jk_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger jk_weekday; ///< Weekday component
@property (nonatomic, readonly) NSInteger jk_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger jk_weekOfMonth; ///< WeekOfMonth component
@property (nonatomic, readonly) NSInteger jk_weekOfYear; ///< WeekOfYear component
@property (nonatomic, readonly) NSInteger jk_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger jk_quarter; ///< Quarter component

@property (nonatomic, readonly) BOOL jk_isLeapMonth; ///< 是否闰月
@property (nonatomic, readonly) BOOL jk_isLeapYear; ///< 是否闰年


@end
