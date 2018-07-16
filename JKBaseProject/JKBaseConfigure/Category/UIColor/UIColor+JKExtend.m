//
//  UIColor+JKExtend.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "UIColor+JKExtend.h"

static const CGFloat kFBRGBMax = 255.0f;
static const uint32_t kColorMaskRed     = 0xFF000000;
static const uint32_t kColorMaskGreen   = 0xFF0000;
static const uint32_t kColorMaskBlue    = 0xFF00;
static const uint32_t kColorMaskAlpha   = 0xFF;

UIColor *JKUIColorWithHexRGB(uint32_t rgbValue)
{
    uint32_t newValue = (rgbValue << 8) | kColorMaskAlpha;
    return JKUIColorWithHexRGBA(newValue);
}

UIColor *JKUIColorWithHexRGBA(uint32_t rgbaValue)
{
    //  R   G  B  A
    //0xFF FF FF FF
    uint8_t r = (rgbaValue & kColorMaskRed) >> 24;
    uint8_t g = (rgbaValue & kColorMaskGreen) >> 16;
    uint8_t b = (rgbaValue & kColorMaskBlue) >> 8;
    uint8_t a = (rgbaValue & kColorMaskAlpha) / kFBRGBMax;
    return JKUIColorWithRGBA(r,g,b,a);
}

UIColor *JKUIColorWithRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a)
{
    return [UIColor colorWithRed:(r / kFBRGBMax)
                           green:(g / kFBRGBMax)
                            blue:(b / kFBRGBMax)
                           alpha:a];
}

UIColor *JKUIColorWithRGB(uint8_t r, uint8_t g, uint8_t b)
{
    return JKUIColorWithRGBA(r, g, b, 1.0f);
}


@implementation UIColor (JKExtend)

/**
 *  获取16进制字符串的颜色
 *
 *  @param color 0XFFFFFF or #FFFFFF or FFFFFF
 *
 *  @return UIColor
 */
+ (UIColor *)jk_colorWithHexString:(NSString *)color{
    return [self jk_colorWithHexStrings:color withAlpha:1.0];
}


+ (UIColor *)jk_colorWithHexStrings:(NSString *)color withAlpha:(CGFloat )alpha{
    
    NSString *cString = [color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].uppercaseString;
    
    // String should be 6 or 8 characters
    if (cString.length < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if (cString.length != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    
    if (alpha > 1) {
        alpha = 1;
    }
    
    if (alpha < 0) {
        alpha = 0;
    }
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
    
}

+ (UIColor *)jk_getSameColourNum:(CGFloat )colourNum{
    return [UIColor colorWithRed:colourNum/255.f green:colourNum/255.f blue:colourNum/255.f alpha:1];
}

/**
 * 随机颜色
 */
+ (instancetype)jk_randomColor {
    return [UIColor jk_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}



/**
 *  @brief  渐变颜色
 *
 *  @param fromColor  开始颜色
 *  @param toColor    结束颜色
 *  @param height     渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)jk_gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)fromColor.CGColor, (id)toColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}





#pragma mark - Private Method
+ (instancetype)jk_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}












@end
