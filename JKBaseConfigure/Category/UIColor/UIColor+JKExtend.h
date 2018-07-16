//
//  UIColor+JKExtend.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//#import "JKCategoryMacro.h"

UIKIT_EXTERN UIColor *JKUIColorWithHexRGB(uint32_t rgbValue);
UIKIT_EXTERN UIColor *JKUIColorWithHexRGBA(uint32_t rgbaValue);

UIKIT_EXTERN UIColor *JKUIColorWithRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a);
UIKIT_EXTERN UIColor *JKUIColorWithRGB(uint8_t r, uint8_t g, uint8_t b);


#ifndef UIColorRGB   //e.g. UIColorRGB(0.5, 0.2, 0.3)
#define UIColorRGB(r, g, b)     [UIColor colorWithRed:(r) green:(g) blue:(b) alpha: 1]
#endif
#ifndef UIColorRGBA  //e.g. UIColorRGBA(0.5, 0.2, 0.3, 1)
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha: (a)]
#endif
#ifndef UIColorHSB   //e.g. UIColorHSB(0, 1, 0, 0.5)
#define UIColorHSB(h, s, b)     [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:1]
#endif
#ifndef UIColorHSBA  //e.g. UIColorHSBA(1,0,0,0.5)
#define UIColorHSBA(h, s, b, a) [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:(a)]
#endif
#ifndef UIColorHSL   //e.g. UIColorHSL(1,0,0.5)
#define UIColorHSL(h, s, l)     [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:1]
#endif
#ifndef UIColorHSLA  //e.g. UIColorHSLA(1,0,0,0.5)
#define UIColorHSLA(h, s, l, a) [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:(a)]
#endif
#ifndef UIColorCMYK  //e.g. UIColorCMYK(0,0,1,0.5)
#define UIColorCMYK(c, m, y, k) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:1]
#endif
#ifndef UIColorCMYKA //e.g. UIColorCMYKA(0,0,1,0,0.5)
#define UIColorCMYKA(c, m, y, k, a) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:(a)]
#endif
#ifndef UIColorHex   //e.g. UIColorHex(#66ccff)  UIColorHex(66CCFF88)  (支持 rgb/rgba/rrggbb/rrggbbaa)
#define UIColorHex(hex)   [UIColor jk_colorWithHexString:(@#hex)]
#endif


@interface UIColor (JKExtend)


/**
 获取16进制字符串的颜色
 
 @param color 0XFFFFFF or #FFFFFF or FFFFFF
 @return UIColor
 */
+ (UIColor *)jk_colorWithHexString:(NSString *)color;


/**
 获取16进制字符串的颜色 + 透明度
 */
+ (UIColor *)jk_colorWithHexStrings:(NSString *)color withAlpha:(CGFloat )alpha;


/**
 获取相同标号的颜色

 @param colourNum 0 ~ 255
 @return UIColor
 */
+ (UIColor *)jk_getSameColourNum:(CGFloat )colourNum;


/**
 * 随机颜色
 */
+ (instancetype)jk_randomColor;

/**
 *  @brief  渐变颜色
 *
 *  @param fromColor  开始颜色
 *  @param toColor    结束颜色
 *  @param height     渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)jk_gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;


@end
