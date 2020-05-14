//
//  NSNotificationCenter+YACONoti.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSNotificationCenter+YACONoti.h"



@implementation NSNotificationCenter (YACONoti)
- (void)yaco_safeAddObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    [self removeObserver:observer name:aName object:anObject];
    [self addObserver:observer selector:aSelector name:aName object:anObject];
}
@end
