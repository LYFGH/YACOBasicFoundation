//
//  NSArray+YACOArray.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YACOArray)
// Array转换成Json
- (NSString *)yaco_jsonValue;

// Array转换成Json NSData
- (id)yaco_jsonData;

#pragma mark - Safe
- (id)yaco_safeObjectAtIndex:(NSUInteger)index;
- (id)yaco_safeSubarrayWithRange:(NSRange)range;

- (NSInteger)yaco_safeIndexOfObject:(id)object;
@end

NS_ASSUME_NONNULL_END
