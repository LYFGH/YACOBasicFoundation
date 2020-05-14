//
//  NSMutableDictionary+YACODic.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (YACODic)
- (void)yaco_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)yaco_safeRemoveObjectForKey:(id<NSCopying>)aKey;
- (void)yaco_safeAppendDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
