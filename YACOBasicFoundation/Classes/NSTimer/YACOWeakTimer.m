//
//  YACOWeakTimer.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOWeakTimer.h"
@interface YACOWeakTimer()
@property (nonatomic, assign) SEL selector;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, weak) id target;

@end
@implementation YACOWeakTimer
+ (NSTimer *)yaco_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats
{
    YACOWeakTimer *weakTimer = [[YACOWeakTimer alloc] init];
    weakTimer.target = aTarget;
    weakTimer.selector = aSelector;
    weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakTimer selector:@selector(fire:) userInfo:userInfo repeats:repeats];
    
    return weakTimer.timer;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)fire:(NSTimer *)timer
{
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else {
        [self.timer invalidate];
    }
}
#pragma clang diagnostic pop
@end
