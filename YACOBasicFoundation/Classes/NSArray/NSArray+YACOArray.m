//
//  NSArray+YACOArray.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSArray+YACOArray.h"

@implementation NSArray (YACOArray)
- (NSString *)yaco_jsonValue
{
    NSData *data = [self yaco_jsonData];
    if (data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (id)yaco_jsonData
{
    if (self) {
        return  [NSJSONSerialization dataWithJSONObject:self
                                                options:kNilOptions
                                                  error:nil];
    }
    
    return nil;
}

- (id)yaco_safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (id)yaco_safeSubarrayWithRange:(NSRange)range
{
    if (range.location + range.length <= self.count) {
        return [self subarrayWithRange:range];
    }
    
    return nil;
}

- (NSInteger)yaco_safeIndexOfObject:(id)object
{
    if (object) {
        return [self indexOfObject:object];
    }
    
    return NSNotFound;
}

@end
