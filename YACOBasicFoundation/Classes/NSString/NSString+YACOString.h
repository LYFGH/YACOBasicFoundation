//
//  NSString+YACOString.h
//  YACOBasicFoundation
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YACOString)
#pragma mark - Json
/// 转换成Json字典
- (id)yaco_jsonValue;

/// url参数转换成Json字典
- (id)yaco_urlConvertJson;

/// 将URL参数转换成字典
- (NSDictionary *)yaco_urlConvertDictionary;

#pragma mark - BOOL

/// 是否包含指定字符串
/// @param string 字符串
- (BOOL)yaco_contains:(NSString *)string;

/// 是否以某字符串结尾
/// @param endString 结尾字符串
/// @param caseInsensitive 是否不区分大小写
- (BOOL)yaco_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive;

/// 判断字符串是否为空或者长度为0
- (BOOL)yaco_nilOrEmpty;

/// 验证邮箱格式
- (BOOL)yaco_validEmail;

/// 验证电话格式
- (BOOL)yaco_validMobile;

/// 验证手机格式
- (BOOL)yaco_validFixPhone;

/// 验证身份证格式
- (BOOL)yaco_validIDCard;

/// 是否全部是数字
- (BOOL)yaco_allNumbers;

/// 是否全部为数字，且可以包含小数点
- (BOOL)yaco_allDecimalDigit;

/// 是否包含中文 英文 数字 下划线
- (BOOL)yaco_validContainsChiEng;

/// 是否包含英文 数字
- (BOOL)yaco_validContainsNumEng;

/// 是否包含中文
- (BOOL)yaco_hasChinese;

/// 是否为图片链接
- (BOOL)yaco_imageURLString;

/// 是否为JavaScript文件链接
- (BOOL)yaco_javascriptURLString;

/// 是否为URL链接
- (BOOL)yaco_urlString;

/// 是否为gif图片链接
- (BOOL)yaco_gifImageUrl;

/// 是否包含emoji表情
- (BOOL)yaco_containsEmoji;



#pragma mark 加密

/// MD5加密
/// @param string 需要加密的字符串
- (NSString *)yaco_md5:(NSString *)string;


/// AES128加密
/// @param encryptText 需要加密的字符串
/// @param key 公钥
- (NSString *)yaco_AES128Decrypt:(NSString *)encryptText key:(NSString *)key;


#pragma mark 文字高度计算

/// 根据字体、行数、行间距和指定的宽度constrainedWidth计算文本占据的size
///  @param font 字体
///  @param numberOfLines 显示文本行数，值为0不限制行数
///  @param lineSpacing 行间距
///  @param constrainedWidth 文本指定的宽度
- (CGSize)yaco_textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth;


///  根据字体、行数、行间距和指定的宽度constrainedWidth计算文本占据的size
///  @param font 字体
///  @param numberOfLines 显示文本行数，值为0不限制行数
///  @param constrainedWidth 文本指定的宽度
- (CGSize)yaco_textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
          constrainedWidth:(CGFloat)constrainedWidth;

/// 计算字符串长度（一行时候）
- (CGSize)yaco_textSizeWithFont:(UIFont*)font
                limitWidth:(CGFloat)maxWidth;

- (CGSize)yaco_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;



@end

NS_ASSUME_NONNULL_END
