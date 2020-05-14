//
//  NSMutableDictionary+YACODic.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSMutableDictionary+YACODic.h"


@implementation NSMutableDictionary (YACODic)
- (void)yaco_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (!anObject) {
        [self removeObjectForKey:aKey];
        return;
    }
    [self setObject:anObject forKey:aKey];
}

- (void)yaco_safeRemoveObjectForKey:(id<NSCopying>)aKey
{
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
}

- (void)yaco_safeAppendDictionary:(NSDictionary *)dictionary
{
    __weak typeof(self) weakSelf = self;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf yaco_safeSetObject:obj forKey:key];
    }];
}
@end
