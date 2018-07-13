//
//  UIImage+JKImage.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (JKImage)
/**
 截屏

 @return UIImage
 */
+(instancetype)jk_snapshotCurrentScreen;

/**
 图片模糊效果
 
 @return UIImage
 */
- (UIImage *)jk_blur;


/**
 高效添加圆角图片

 @param radius  radius
 @param size    size
 @return        UIImage
 */
- (UIImage*)jk_imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;


/**
 圆形图片

 @param image   image
 @return        UIImage
 */
+ (UIImage *)jk_GetRoundImagewithImage:(UIImage *)image;



/**
 在图片上居中加文字

 @param title       文字
 @param fontSize    大小
 @param titleColor  颜色
 @return            UIImage
 */
- (UIImage *)jk_imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;



/**
 取图片某一像素点的颜色
 
 @param point 图片上的某一点
 @return      图片上这一点的颜色
 */
- (UIColor *)jk_colorAtPixel:(CGPoint)point;



/**
 生成一个纯色的图片
 
 @param color 图片颜色
 @return      返回的纯色图片
 */
- (UIImage *)jk_imageWithColor:(UIColor *)color;



/**
 获得灰度图

 @return    UIImage
 */
- (UIImage *)jk_convertToGrayImage;


+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

/**
 合并图片

 @param firstImage      第一张图片
 @param secondImage     第二张图片
 @return                UIImage
 */
+ (UIImage*)jk_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

/**
 压缩图片

 @param maxLength   最大字节大小为maxLength
 @return            图片的NSData数据
 */
- (NSData *)compressWithMaxLength:(NSInteger)maxLength;

/**
 纠正图片的方向

 @return UIImage
 */
- (UIImage *)fixOrientation;

/**
 按给定的方向旋转图片

 @param orient   方向
 @return         UIImage
 */
- (UIImage*)jk_rotate:(UIImageOrientation)orient;

/**
 垂直翻转

 @return UIImage
 */
- (UIImage *)jk_flipVertical;

/**
 水平翻转

 @return UIImage
 */
- (UIImage *)jk_flipHorizontal;

/**
 旋转图片

 @param degrees     旋转的角度
 @return            UIImage
 */
- (UIImage *)jk_imageRotatedByDegrees:(CGFloat)degrees;

/**
 旋转图片
 
 @param radians     旋转的弧度
 @return            UIImage
 */
- (UIImage *)jk_imageRotatedByRadians:(CGFloat)radians;

/**
 截取当前image对象rect区域内的图像

 @param rect    区域大小
 @return        UIImage
 */
- (UIImage *)jk_subImageWithRect:(CGRect)rect;


/**
 压缩图片至指定尺寸

 @param size    指定尺寸
 @return        UIImage
 */
- (UIImage *)jk_rescaleImageToSize:(CGSize)size;

/**
 压缩图片至指定像素

 @param toPX    指定像素
 @return        UIImage
 */
- (UIImage *)jk_rescaleImageToPX:(CGFloat )toPX;

/**
 在指定的size里面生成一个平铺的图片

 @param size    指定的size
 @return        UIImage
 */
- (UIImage *)jk_getTiledImageWithSize:(CGSize)size;


/**
 UIView转化为UIImage

 @param view    UIView
 @return        UIImage
 */
+ (UIImage *)jk_imageFromView:(UIView *)view;


/**
 图像裁剪

 @param rect 裁剪到的大小
 @return     UIImage
 */
- (UIImage *)jk_imageCroppedToRect:(CGRect)rect;

/**
 比例放大缩小

 @param size    比例
 @return        UIImage
 */
- (UIImage *)jk_imageScaledToSize:(CGSize)size;


/**
 比例放大缩小到 合适的大小

 @param size    合适的大小
 @return        UIImage
 */
- (UIImage *)jk_imageScaledToFitSize:(CGSize)size;


/**
 铺满指定大小

 @param size    指定大小
 @return        UIImage
 */
- (UIImage *)jk_imageScaledToFillSize:(CGSize)size;


- (UIImage *)jk_imageCroppedAndScaledToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode padToFit:(BOOL)padToFit;

- (UIImage *)jk_reflectedImageWithScale:(CGFloat)scale;

- (UIImage *)jk_imageWithReflectionWithScale:(CGFloat)scale gap:(CGFloat)gap alpha:(CGFloat)alpha;

//带有阴影效果的图片
- (UIImage *)imageWithShadowColor:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur;
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;
- (UIImage *)imageWithAlpha:(CGFloat)alpha;
- (UIImage *)imageWithMask:(UIImage *)maskImage;

- (UIImage *)maskImageFromImageAlpha;
























@end
