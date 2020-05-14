//
//  NSNotificationCenter+YACONoti.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (YACONoti)
// 安全添加

/// 安全添加通知
/// @param observer 观察者
/// @param aSelector 方法
/// @param aName 通知名字
/// @param anObject 观察者
- (void)yaco_safeAddObserver:(id)observer
                   selector:(SEL)aSelector
                       name:(NSString *)aName
                     object:(id)anObject;
@end

NS_ASSUME_NONNULL_END
