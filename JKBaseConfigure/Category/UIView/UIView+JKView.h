//
//  UIView+JKView.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);
typedef void (^LongPressActionBlock)(UILongPressGestureRecognizer *gestureRecoginzer);

@interface UIView (JKView)

//截取成图片
- (UIImage *)jk_snapshotImage;

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)jk_addTapActionWithBlock:(TapActionBlock)block;

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)jk_addLongPressActionWithBlock:(LongPressActionBlock)block;

/** 找到指定类名的subView */
- (UIView *)jk_findSubViewWithClass:(Class)clazz;
- (NSArray *)jk_findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)jk_findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)jk_findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)jk_findViewController;

//所有子视图
- (NSArray *)jk_allSubviews;

//移除所有子视图
- (void)jk_removeAllSubviews;

//xib加载视图
+ (instancetype)jk_loadViewFromNib;
+ (instancetype)jk_loadViewFromNibWithName:(NSString *)nibName;
+ (instancetype)jk_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)jk_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

/**
 * 给UIView 设置圆角
 */
@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL  masksToBounds;

/**
 * 设置 view的 边框颜色(选择器和Hex颜色)
 * 以及 边框的宽度
 */
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable NSString  *borderHexRgb;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;


@end
