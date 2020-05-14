//
//  NSData+YACOData.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSData+YACOData.h"


@implementation NSData (YACOData)

- (id)yaco_jsonObject
{
    NSError *error = nil;
    if (self.length) {
        id json = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            return nil;
        }
        return json;
    }
    
    return nil;
}

@end
