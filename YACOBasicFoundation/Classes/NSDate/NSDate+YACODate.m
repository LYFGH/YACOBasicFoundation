//
//  NSDate+YACODate.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSDate+YACODate.h"
#import "NSDateFormatter+YACODate.h"

#define kYACO_MINUTE     60
#define kYACO_HOUR       3600
#define kYACO_DAY        86400
#define kYACO_WEEK       604800
#define kYACO_YEAR       31556926

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);


@implementation NSDate (YACODate)
+ (NSString *)yaco_nowDateLongString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)yaco_nowDateShortString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter stringFromDate:[NSDate date]];
}

+ (BOOL)yaco_isToadyInRange:(NSString *)beginDateInterVal and:(NSString *)endDateInterVal
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *todayDate = [NSDate date];
    NSDate *beginDate = [NSDate dateWithTimeIntervalSince1970:[beginDateInterVal longLongValue]/1000];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[endDateInterVal longLongValue]/1000];
    
    if (!beginDate || !endDate) {
        return NO;
    }
    
    if ([[todayDate laterDate:beginDate] isEqualToDate:todayDate] && [[todayDate earlierDate:endDate] isEqualToDate:todayDate]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)yaco_convertDateIntervalToStringWith:(NSString *)aInterVal
{
    time_t statusCreateAt_t;
    NSString *timestamp = nil;
    time_t now;
    time(&now);
    
    statusCreateAt_t = (time_t)[aInterVal longLongValue];
    
    struct tm *nowtime;
    nowtime = localtime(&now);
    uint32_t thour = nowtime->tm_hour;
    
    localtime(&statusCreateAt_t);
    
    int distance = (int)difftime(now, statusCreateAt_t);
    if (distance < 0) {
        distance = 0;
    }
    
    if (distance < 30) {
        timestamp = @"刚刚";
    } else if (distance < 60) {
        timestamp = @"30秒前";
    } else if (distance < 60 * 60) {/* 小于1小时 */
        distance = distance / 60;
        if (distance == 0) {
            distance = 1;
        }
        timestamp = [NSString stringWithFormat:@"%d分钟前", distance];
    } else if (distance < (60 * 60 * (thour))) {/* 大于1小时，但是在今日 */
        
        timestamp = [NSString stringWithFormat:@"%d小时前", distance / 60 / 60];
    } else {
        NSDate *date_now = [NSDate dateWithTimeIntervalSince1970:now];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:statusCreateAt_t];
        NSInteger dateYear = [date yaco_year];
        NSInteger nowYear = [date_now yaco_year];
        
        if (dateYear == nowYear) {
            NSDateFormatter *dateFormatter = [NSDateFormatter yaco_dateFormatterWithFormat:@"MM-dd HH:mm"];
            timestamp = [dateFormatter stringFromDate:date];
        } else {
            NSDateFormatter *dateFormatter = [NSDateFormatter yaco_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm"];
            timestamp = [dateFormatter stringFromDate:date];
        }
    }
    
    return timestamp;
}

+ (NSString *)yaco_convertDateIntervalToSimpleStringWith:(NSString *)aInterVal
{
    time_t statusCreateAt_t;
    NSString *timestamp = nil;
    time_t now;
    time(&now);
    
    statusCreateAt_t = (time_t)[aInterVal longLongValue];
    
    struct tm *nowtime;
    nowtime = localtime(&now);
    uint32_t thour = nowtime->tm_hour;
    
    localtime(&statusCreateAt_t);
    
    int distance = (int)difftime(now, statusCreateAt_t);
    if (distance < 0) {
        distance = 0;
    }
    
    if (distance < 60 * 60) {/* 小于1小时 */
        distance = distance / 60;
        if (distance == 0) {
            distance = 1;
        }
        timestamp = [NSString stringWithFormat:@"%d分钟前", distance];
    } else if (distance < (60 * 60 * (thour))) {/* 大于1小时，但是在今日 */
        distance = distance / (60 * 60);
        if (distance == 0) {
            distance = 1;
        }
        timestamp = [NSString stringWithFormat:@"%d小时前", distance];
    } else {
        NSDate *date_now = [NSDate dateWithTimeIntervalSince1970:now];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:statusCreateAt_t];
        NSInteger dateYear = [date yaco_year];
        NSInteger nowYear = [date_now yaco_year];
        
        if (dateYear == nowYear) {
            NSDateFormatter *dateFormatter = [NSDateFormatter yaco_dateFormatterWithFormat:@"MM-dd"];
            timestamp = [dateFormatter stringFromDate:date];
        } else {
            NSDateFormatter *dateFormatter = [NSDateFormatter yaco_dateFormatterWithFormat:@"yyyy-MM-dd"];
            timestamp = [dateFormatter stringFromDate:date];
        }
    }
    
    return timestamp;
}

+ (NSCalendar *)yaco_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    }
    
    return sharedCalendar;
}

- (NSString *)yaco_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter yaco_dateFormatterWithFormat:@""];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
//    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *)yaco_shortString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)yaco_shortTimeString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)yaco_shortDateString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)yaco_mediumString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)yaco_mediumTimeString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)yaco_mediumDateString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)yaco_longString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)yaco_longTimeString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)yaco_longDateString
{
    return [self yaco_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSInteger)yaco_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + kYACO_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger)yaco_hour
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger)yaco_minute
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger)yaco_seconds
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger)yaco_day
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger)yaco_month
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger)yaco_weekOfMonth
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger)yaco_weekOfYear
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfYear;
}

- (NSInteger)yaco_weekday
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger)yaco_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)yaco_numbersOfDaysInThisMonth
{
    NSRange range = [[NSDate yaco_currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    return range.length;
}

- (NSInteger)yaco_year
{
    NSDateComponents *components = [[NSDate yaco_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}
@end
