//
//  UIView+JKAdd.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKAdd)

/**
 Create a snapshot image of the complete view hierarchy.
 This method should be called in main thread.
 */
- (UIImage *)jk_snapshotImage;

/**
 Create a snapshot PDF of the complete view hierarchy.
 This method should be called in main thread.
 */
- (NSData *)jk_snapshotPDF;

/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)jk_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;
/**
 *  设置阴影 郭liyuan+
 */
- (void) jk_makeInsetShadow;
- (void) jk_makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void) jk_makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)jk_removeAllSubviews;

/**
 Returns the view's view controller (may be nil).
 */
@property (nonatomic, readonly, getter=jk_viewController) UIViewController *viewController;

@property (nonatomic, setter=setJk_left:, getter=jk_left) CGFloat left;    ///< Shortcut for frame.origin.x.
@property (nonatomic, setter=setJk_top:, getter=jk_top) CGFloat top;     ///< Shortcut for frame.origin.y
@property (nonatomic, setter=setJk_right:, getter=jk_right) CGFloat right;   ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, setter=setJk_bottom:, getter=jk_bottom) CGFloat bottom;  ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, setter=setJk_width:, getter=jk_width) CGFloat width;   ///< Shortcut for frame.size.width.
@property (nonatomic, setter=setJk_height:, getter=jk_height) CGFloat height;  ///< Shortcut for frame.size.height.
@property (nonatomic, setter=setJk_centerX:, getter=jk_centerX) CGFloat centerX; ///< Shortcut for center.x
@property (nonatomic, setter=setJk_centerY:, getter=jk_centerY) CGFloat centerY; ///< Shortcut for center.y
@property (nonatomic, setter=setJk_origin:, getter=jk_origin) CGPoint origin;  ///< Shortcut for frame.origin.
@property (nonatomic, getter=jk_size, setter=setJk_size: ) CGSize size;     ///< Shortcut for frame.size.


@property (nonatomic, readonly) CGRect jk_screenFrame; ///< View frame on the screen, taking into account scroll views.

/**
 Returns the visible alpha on screen, taking into account superview and window.
 */
@property (nonatomic, readonly) CGFloat jk_visibleAlpha;


/**
 Converts a point from the receiver's coordinate system to that of the specified view or window.
 
 @param point A point specified in the local coordinate system (bounds) of the receiver.
 @param view  The view or window into whose coordinate system point is to be converted.
 If view is nil, this method instead converts to window base coordinates.
 @return The point converted to the coordinate system of view.
 */
- (CGPoint)jk_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view;

/**
 Converts a point from the coordinate system of a given view or window to that of the receiver.
 
 @param point A point specified in the local coordinate system (bounds) of view.
 @param view  The view or window with point in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The point converted to the local coordinate system (bounds) of the receiver.
 */
- (CGPoint)jk_convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view;

/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)jk_convertRect:(CGRect)rect toViewOrWindow:(UIView *)view;

/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)jk_convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view;

/**
 *  返回响应者链上的任意Objc
 *
 *  @param viewControllerCls 需要返回的Obj的类名,为nil时默认返回当前控制器
 *
 *  @return viewController Or needCls
 */
- (nonnull id)jk_viewControllerWithNeedViewOrViewController:(nullable Class)viewControllerCls
;


/// 移除所有子视图中 tableview、scrollview 的 delegate、datasource
- (void)jk_clearScrollViewDelegate;


- (void)jk_removeAllGestures;
- (void)jk_removeAllGesturesWithSubViews;

/// 在 block 内禁用动画
+ (void)jk_disableAnimationWithBlock:(void (^)(void))block;

@end
