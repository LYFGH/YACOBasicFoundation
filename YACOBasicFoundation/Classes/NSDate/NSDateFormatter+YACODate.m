//
//  NSDateFormatter+YACODate.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSDateFormatter+YACODate.h"

static NSMutableDictionary *formatters = nil;

@implementation NSDateFormatter (YACODate)
+ (NSDateFormatter *)yaco_dateFormatterWithFormat:(NSString *)formmat
{
    return [self yaco_dateFormatterWithKey:[NSString stringWithFormat:@"<%@>", formmat] configBlock: ^(NSDateFormatter *formatter) {
        if (formatter) {
            [formatter setDateFormat:formmat];
        }
    }];
}

+ (NSDateFormatter *)yaco_dateFormatterWithKey:(NSString *)key configBlock:(YACODateFormmaterConfigBlock)cofigBlock
{
    NSString *strKey = nil;
    if (!key) {
        strKey = @"defaultFormatter";
    } else {
        strKey = [key copy];
    }
    
    @synchronized(self) {
        NSDateFormatter *dateFormatter = [[self formatters] objectForKey:strKey];
        if (!dateFormatter) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [[self formatters] setObject:dateFormatter forKey:strKey];
            
            if (cofigBlock) {
                cofigBlock(dateFormatter); //配置它
            }
            return dateFormatter;
        }
        
        return dateFormatter;
    }
}

+ (NSMutableDictionary *)formatters
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!formatters) {
            formatters = [[NSMutableDictionary alloc] init];
        }
    });
    
    return formatters;
}

@end
