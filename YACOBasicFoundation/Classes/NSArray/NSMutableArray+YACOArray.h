//
//  NSMutableArray+YACOArray.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (YACOArray)
#pragma mark - Safe
#pragma mark Add

/// 添加obj
/// @param obj 要添加的数据
- (void)yaco_safeAddObject:(id)obj;

/// 添加数组
/// @param otherArray 数组
- (void)yaco_safeAddObjectsFromArray:(NSArray *)otherArray;

/// 添加obj
/// @param obj 要添加的数据
- (BOOL)yaco_addObject:(id)obj;

#pragma mark Insert

/// 替换数据
/// @param obj 数据
/// @param index 位置
- (void)yaco_safeInsertObject:(id)obj atIndex:(NSUInteger)index;

/// 替换数组数据
/// @param objects 数组数据
/// @param indexes 位置集合
- (void)yaco_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

#pragma mark Remove

/// 删除数据
/// @param anObject 数据
- (void)yaco_safeRemoveObject:(id)anObject;

/// 删除所有数据
- (void)yaco_safeRemoveLastObject;

/// 删除数据
/// @param anObject 数据
/// @param aRange 长度
- (void)yaco_safeRemoveObject:(id)anObject inRange:(NSRange)aRange;

/// 删除某位置的数据
/// @param index 位置
- (void)yaco_safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)yaco_safeRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)aRange;
- (void)yaco_safeRemoveObjectsAtIndexex:(NSIndexSet *)indexes;

#pragma mark Replace
- (void)yaco_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)yaco_safeReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
@end

NS_ASSUME_NONNULL_END
