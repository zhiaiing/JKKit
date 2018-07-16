//
//  NSString+JKAdd.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "NSString+JKAdd.h"
#import "JKCategoryMacro.h"

static BOOL g_allowedCharacters = NO;
static BOOL g_stringByRemovingPercentEncoding = NO;

@implementation NSString (JKAdd)





- (CGSize)jk_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = @{}.mutableCopy;
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return CGSizeCeil(result);
}

- (CGFloat)jk_widthForFont:(UIFont *)font {
    CGSize size = [self jk_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGFloat)jk_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self jk_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

- (CGFloat)heightForString:(NSString *)str font:(UIFont *)font width:(CGFloat)width {
    CGFloat height;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        CGRect rect = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{ NSFontAttributeName: font } context:nil];
        height = rect.size.height;
        height += 1;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
        height = size.height;
    }
    return height;
}

- (CGFloat)jk_heightForFont:(UIFont *)font width:(CGFloat)width line:(NSInteger)line {
    NSMutableString *test = NSMutableString.new;
    for (int i=0; i<line; i++) {
        [test appendString:@"字"];
    }
    CGFloat maxHeight = [self heightForString:test font:font width:1];
    CGFloat height = [self heightForString:self font:font width:width];
    return height > maxHeight ? maxHeight : height;
}










- (NSString *)jk_stringByURLEncode {
    return [self jk_stringByURLEncode:NSUTF8StringEncoding];
}

- (NSString *)jk_stringByURLDecode {
    return [self jk_stringByURLDecode:NSUTF8StringEncoding];
}

- (NSString *)jk_stringByURLEncode:(NSStringEncoding)encoding {
    
    static NSString * const  allowedCharacters = @"!*'();:@&=+$,/?%#[]";
    g_allowedCharacters = [NSString instancesRespondToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)];
    if (g_allowedCharacters) {
        static NSCharacterSet * characterSet = nil;
        if (characterSet == nil) {
            characterSet = [NSCharacterSet characterSetWithCharactersInString:allowedCharacters];
        }
        return  [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    } else {
        CFStringRef escaped = NULL;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        escaped = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                          (CFStringRef)self,
                                                          NULL,
                                                          (CFStringRef)allowedCharacters,
                                                          (CFStringEncoding)encoding);
#pragma clang diagnostic pop
        
#if defined(__has_feature) && __has_feature(objc_arc)
        return CFBridgingRelease(escaped);
#else
        return [(NSString *)escaped autorelease];
#endif
    }
}

- (NSString *)jk_stringByURLDecode:(NSStringEncoding)encoding {
    
    g_stringByRemovingPercentEncoding = [NSString instancesRespondToSelector:@selector(stringByRemovingPercentEncoding)];
    NSMutableString *resultString = [NSMutableString stringWithString:self];
    [resultString replaceOccurrencesOfString:@"+"
                                  withString:@" "
                                     options:NSLiteralSearch
                                       range:NSMakeRange(0, [resultString length])];
    
    
    if (g_stringByRemovingPercentEncoding) {
        return resultString.stringByRemovingPercentEncoding;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [resultString stringByReplacingPercentEscapesUsingEncoding:encoding];
#pragma clang diagnostic pop
    }
}


- (NSString *)jk_stringByEscapingHTML {
    NSUInteger len = self.length;
    if (!len) return self;
    
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [self getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableString *result = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        unichar c = buf[i];
        NSString *esc = nil;
        switch (c) {
            case 34: esc = @"&quot;"; break;
            case 38: esc = @"&amp;"; break;
            case 39: esc = @"&apos;"; break;
            case 60: esc = @"&lt;"; break;
            case 62: esc = @"&gt;"; break;
            default: break;
        }
        if (esc) {
            [result appendString:esc];
        } else {
            CFStringAppendCharacters((CFMutableStringRef)result, &c, 1);
        }
    }
    free(buf);
    return result;
}

















@end
