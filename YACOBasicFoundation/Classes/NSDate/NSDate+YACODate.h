//
//  NSDate+YACODate.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YACODate)
// 当前时间 yyyy-MM-dd hh:mm:ss
+ (NSString *)yaco_nowDateLongString;

// 当前时间 yyyy-MM-dd
+ (NSString *)yaco_nowDateShortString;

// 当前是否在两个时间之间
+ (BOOL)yaco_isToadyInRange:(NSString *)beginDateInterVal and:(NSString *)endDateInterVal;

// 根据时间戳 时间轴展示
+ (NSString *)yaco_convertDateIntervalToStringWith:(NSString *)aInterVal;
+ (NSString *)yaco_convertDateIntervalToSimpleStringWith:(NSString *)aInterVal;

+ (NSCalendar *)yaco_currentCalendar; // avoid bottlenecks

#pragma mark - Property
@property (nonatomic, readonly) NSString *yaco_shortString;
@property (nonatomic, readonly) NSString *yaco_shortDateString;
@property (nonatomic, readonly) NSString *yaco_shortTimeString;
@property (nonatomic, readonly) NSString *yaco_mediumString;
@property (nonatomic, readonly) NSString *yaco_mediumDateString;
@property (nonatomic, readonly) NSString *yaco_mediumTimeString;
@property (nonatomic, readonly) NSString *yaco_longString;
@property (nonatomic, readonly) NSString *yaco_longDateString;
@property (nonatomic, readonly) NSString *yaco_longTimeString;

@property (readonly) NSInteger yaco_nearestHour;
@property (readonly) NSInteger yaco_hour;
@property (readonly) NSInteger yaco_minute;
@property (readonly) NSInteger yaco_seconds;
@property (readonly) NSInteger yaco_day;
@property (readonly) NSInteger yaco_month;
@property (readonly) NSInteger yaco_weekOfMonth;
@property (readonly) NSInteger yaco_weekOfYear;
@property (readonly) NSInteger yaco_weekday;
@property (readonly) NSInteger yaco_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger yaco_year;
@property (readonly) NSInteger yaco_numbersOfDaysInThisMonth;
@end

NS_ASSUME_NONNULL_END
