//
//  NSData+YACOData.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (YACOData)

/// 转换成NSObject
- (id)yaco_jsonObject;

@end

NS_ASSUME_NONNULL_END
