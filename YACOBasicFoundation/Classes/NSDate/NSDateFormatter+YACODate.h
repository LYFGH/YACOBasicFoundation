//
//  NSDateFormatter+YACODate.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//


#import <Foundation/Foundation.h>


typedef void (^YACODateFormmaterConfigBlock)(NSDateFormatter * _Nonnull dateFormmater);

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (YACODate)
/// 获取当前格式的时间
/// @param format 时间格式
+ (NSDateFormatter *)yaco_dateFormatterWithFormat:(NSString *)format;

// key 唯一标识
// block 配置formmater的格式
+ (NSDateFormatter *)yaco_dateFormatterWithKey:(NSString *)key configBlock:(YACODateFormmaterConfigBlock)block;
@end

NS_ASSUME_NONNULL_END
