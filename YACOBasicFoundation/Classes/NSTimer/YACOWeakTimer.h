//
//  YACOWeakTimer.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YACOWeakTimer : NSObject
//self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];


// 参照NSTimer穿参

/// 设置一个定时器
/// @param interval 时间间隔
/// @param aTarget 发送消息的目标
/// @param aSelector 将要发送给aTarget的消息
/// @param userInfo 传递的用户信息
/// @param repeats 是否循环
+ (NSTimer *)yaco_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
