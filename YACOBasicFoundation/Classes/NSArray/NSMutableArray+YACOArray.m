//
//  NSMutableArray+YACOArray.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSMutableArray+YACOArray.h"



@implementation NSMutableArray (YACOArray)
- (void)yaco_safeAddObject:(id)obj
{
    if (obj) {
        [self addObject:obj];
    }
}

- (BOOL)yaco_addObject:(id)obj
{
    if (!obj) {
        return NO;
    }
    [self addObject:obj];
    return YES;
}

- (void)yaco_safeAddObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray.count) {
        [self addObjectsFromArray:otherArray];
    }
}

- (void)yaco_safeInsertObject:(id)obj atIndex:(NSUInteger)index
{
    if (obj && index <= self.count) {
        [self insertObject:obj atIndex:index];
    }
}

- (void)yaco_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (objects.count && indexes) {
        [self insertObjects:objects atIndexes:indexes];
    }
}

- (void)yaco_safeRemoveObject:(id)anObject
{
    if (anObject && [self containsObject:anObject]) {
        [self removeObject:anObject];
    }
}

- (void)yaco_safeRemoveLastObject
{
    if (self.count) {
        [self removeLastObject];
    }
}

- (void)yaco_safeRemoveObject:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
        [self removeObject:anObject inRange:aRange];
    }
}

- (void)yaco_safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)yaco_safeRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
        [self removeObjectIdenticalTo:anObject inRange:aRange];
    }
}

- (void)yaco_safeRemoveObjectsAtIndexex:(NSIndexSet *)indexes
{
    if (indexes) {
        [self removeObjectsAtIndexes:indexes];
    }
}

- (void)yaco_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)yaco_safeReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
    if (objects.count && indexes) {
        [self replaceObjectsAtIndexes:indexes withObjects:objects];
    }
}
@end
