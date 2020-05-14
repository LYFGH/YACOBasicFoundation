//
//  NSDictionary+YACODic.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSDictionary+YACODic.h"


@implementation NSDictionary (YACODic)

- (NSString *)yaco_jsonString
{
    if (self) {
        NSData *data = [self yaco_jsonData];
        if (data.length) {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    
    return nil;
}

- (NSString *)yaco_parameterString {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *key in [self allKeys]) {
        NSString *content = [NSString stringWithFormat:@"%@=%@", key, [self yaco_safeObjectForKey:key]];
        [tempArray addObject:content];
    }
    NSString *resultStr = [tempArray componentsJoinedByString:@"&"];
    resultStr = [NSString stringWithFormat:@"%@\n", resultStr];
    return resultStr;
}

- (NSData *)yaco_jsonData
{
    if (self) {
        return  [NSJSONSerialization dataWithJSONObject:self
                                                options:NSJSONWritingPrettyPrinted
                                                  error:nil];
    }
    
    return nil;
}

- (id)yaco_safeObjectForKey:(id<NSCopying>)aKey
{
    if (aKey) {
        return [self objectForKey:aKey];
    }
    
    return nil;
}


@end
