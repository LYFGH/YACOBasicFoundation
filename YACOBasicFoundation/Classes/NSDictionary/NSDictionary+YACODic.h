//
//  NSDictionary+YACODic.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (YACODic)
/// 转换成Json字符串
- (NSString *)yaco_jsonString;

/// 转成key=value&key=value
- (NSString *)yaco_parameterString;

/// 转换成json NSData
- (NSData *)yaco_jsonData;

#pragma mark - Safe

- (id)yaco_safeObjectForKey:(id<NSCopying>)aKey;
@end

NS_ASSUME_NONNULL_END
