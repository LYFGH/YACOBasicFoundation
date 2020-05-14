//
//  NSString+YACOString.m
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "NSString+YACOString.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YACOString)
- (id)yaco_jsonValue
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data.length) {
        NSError *error = nil;
        id jsonValue = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        return jsonValue ? jsonValue : nil;
    }
    
    return nil;
}

- (id)yaco_urlConvertJson
{
    NSString * jsonValue = [self stringByReplacingOccurrencesOfString:@"&" withString:@"\",\""];
    jsonValue = [jsonValue stringByReplacingOccurrencesOfString:@"=" withString:@"\":\""];
    jsonValue = [NSString stringWithFormat:@"%@%@%@",@"{\"",jsonValue,@"\"}"];
    
    return [jsonValue yaco_jsonValue];
}

- (NSDictionary *)yaco_urlConvertDictionary
{
    if (self.length) {
//        NSString *parameterString =  [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSArray<NSString *> *pramaArray = [self componentsSeparatedByString:@"&"];
        NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
        for (NSString *parameter in pramaArray) {
            NSArray<NSString *> *array = [parameter componentsSeparatedByString:@"="];
            NSString *key = array.firstObject;
            NSString *valueStr = array.lastObject;
            id value = valueStr;
            if (([valueStr hasPrefix:@"{"] && [valueStr hasSuffix:@"}"]) ||
                ([valueStr hasPrefix:@"["] && [valueStr hasSuffix:@"]"])) {
                NSData *data = [valueStr dataUsingEncoding:NSUTF8StringEncoding];
                value = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            }
            resultDic[key] = value;
        }
        return [NSDictionary dictionaryWithDictionary:resultDic];
    }
    return nil;
}

- (BOOL)yaco_contains:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    
    return range.location != NSNotFound;
}

// 是否以某字符串结尾
- (BOOL)yaco_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive
{
    NSRange range;
    if (caseInsensitive) {
        range = [self rangeOfString:endString options:NSCaseInsensitiveSearch];
    } else {
        range = [self rangeOfString:endString];
    }
    
    if (range.location != NSNotFound
        && (range.location + range.length) == self.length) {
        return YES;
    }
    return NO;
}

- (BOOL)yaco_nilOrEmpty
{
    return (self == nil || [self length] == 0 || [self isEqualToString:@""]);
}

- (BOOL)yaco_validEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)yaco_validMobile
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{11}'"];
    return [predicate evaluateWithObject:self];
}

- (BOOL)yaco_validFixPhone
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{10,12}'"];
    return [predicate evaluateWithObject:self];
}

- (BOOL)yaco_validIDCard
{
    NSString *cardRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cardRegex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)yaco_allNumbers
{
    if (self.length < 1) {
        return NO;
    }
    
    for (int i = 0; i < self.length; i++) {
        if (!isnumber([self characterAtIndex:i])) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)yaco_allDecimalDigit
{
    if (self.length < 1) {
        return NO;
    }
    
    NSString *tmp = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(tmp.length == 0 || [tmp isEqualToString:@"."])
    {
        return YES;
    }
    return NO;
}

- (BOOL)yaco_validContainsChiEng
{
    NSString * regex = @"^[\u4e00-\u9fa5A-Za-z0-9_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)yaco_validContainsNumEng
{
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)yaco_hasChinese {
    for (int i = 0; i < self.length; i++) {
        NSString *temp = [self substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (u8Temp != nil &&          //如果u8Temp为nil，会导致crash
            3 == strlen(u8Temp)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)yaco_imageURLString
{
    if ([self hasSuffix:@".png"] || [self hasSuffix:@".jpg"] || [self hasSuffix:@".jpeg"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)yaco_javascriptURLString
{
    NSString *hostStr = [[self componentsSeparatedByString:@"?"] firstObject];
    if ([hostStr hasSuffix:@".js"] && ![hostStr hasSuffix:@"indexPageFile.js"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)yaco_urlString
{
    if ([self yaco_contains:@"http://"] || [self yaco_contains:@"https://"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)yaco_gifImageUrl
{
    if ([self yaco_urlString]) {
        if ([self yaco_contains:@".gif"] || [self yaco_contains:@".GIF"]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)yaco_containsEmoji
{
    __block BOOL result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring yaco_isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

- (BOOL)yaco_isEmoji
{
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

#pragma mark  加密相关
- (NSString *)yaco_md5:(NSString *)string
{
    if(string == nil || [string length] == 0)
        return nil;
    const char *value = [string UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]]; // 32 byte
    }
    return outputString;
}



#pragma mark aes解密
-(NSString *)yaco_AES128Decrypt:(NSString *)encryptText key:(NSString *)key
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptText options:NSDataBase64DecodingIgnoreUnknownCharacters];//base64解码
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        
        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    }
    free(buffer);
    return nil;
}


/**
 根据字体、行数、行间距和constrainedWidth计算文本占据的size
 **/
- (CGSize)yaco_textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth{
    
    if (self.length == 0) {
        return CGSizeZero;
    }
    CGFloat oneLineHeight = font.lineHeight;
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    //  行数
    CGFloat rows = textSize.height / oneLineHeight;
    CGFloat realHeight = oneLineHeight;
    // 0 不限制行数，真实高度加上行间距
    if (numberOfLines == 0) {
        if (rows >= 1) {
            realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
        }
    } else {
        //  行数超过指定行数的时候，限制行数
        if (rows > numberOfLines) {
            rows = numberOfLines;
                }
        realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
    }
    //  返回真实的宽高
    return CGSizeMake(constrainedWidth, realHeight);
}

- (CGSize)yaco_textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
          constrainedWidth:(CGFloat)constrainedWidth{
    
    if (self.length == 0) {
        return CGSizeZero;
    }
    CGFloat oneLineHeight = font.lineHeight;
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    //  行数
    CGFloat rows = textSize.height / oneLineHeight;
    CGFloat realHeight = oneLineHeight;
    // 0 不限制行数，真实高度加上行间距
    if (numberOfLines == 0) {
        if (rows >= 1) {
            realHeight = (rows * oneLineHeight) + (rows - 1) ;
        }
    } else {
        //  行数超过指定行数的时候，限制行数
        if (rows > numberOfLines) {
            rows = numberOfLines;
        }
        realHeight = (rows * oneLineHeight) + (rows - 1) ;
    }
    //  返回真实的宽高
    return CGSizeMake(constrainedWidth, realHeight);
}

/// 计算字符串长度（一行时候）
- (CGSize)yaco_textSizeWithFont:(UIFont*)font
                limitWidth:(CGFloat)maxWidth {
    CGSize size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 36)options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)  attributes:@{ NSFontAttributeName : font} context:nil].size;
    size.width = size.width > maxWidth ? maxWidth : size.width;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

- (CGSize)yaco_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        textSize = [self sizeWithAttributes:attributes];
    } else {
             
        
        textSize = [self boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :font } context:nil].size;
        
//        textSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        
        
    }
    return textSize;
}
@end
