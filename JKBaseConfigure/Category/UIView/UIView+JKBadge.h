//
//  UIView+JKBadge.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -- types definition
typedef NS_ENUM(NSUInteger, LFBadgeType)
{
    LFBadgeTypeRedDot = 0,          /* red dot type */
    LFBadgeTypeNumber,              /* badge with number */
    LFBadgeTypeNew                  /* badge with a fixed text "new" */
};

typedef NS_ENUM(NSUInteger, LFBadgeStyle)
{
    LFBadgeStyleNormal = 0,          /* badge style rectangle  */
    LFBadgeStyleCircle,              /* badge style circle */
};

typedef NS_ENUM(NSUInteger, LFBadgeSizeType) {
    LFBadgeSizeTypeNormal = 0,      /* badge size systom */
    LFBadgeSizeTypeCustom = 1       /* badge size custom */
};



@interface UIView (JKBadge)

@property (nonatomic, strong, setter=setJk_badge:, getter=jk_badge) UILabel *badge;
@property (nonatomic, setter=setJk_badgeOriginX:, getter=jk_badgeOriginX) CGFloat badgeOriginX;
@property (nonatomic, getter=jk_badgeOriginY, setter=setJk_badgeOriginY:) CGFloat badgeOriginY;
@property (nonatomic, getter=jk_showAllNumbers, setter=setJk_showAllNumbers:) BOOL showAllNumbers;//展示完整的数字 (默认超过100展示99+)  等于0也展示




/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)jk_showRedDotBadge;
- (void)jk_showRedDotBadgeBySizeType:(LFBadgeSizeType)sizeType;
- (void)jk_showRedDotBadgeByStyle:(LFBadgeStyle)style;
- (void)jk_showRedDotBadgeByStyle:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType;

/**
 * show badge with WBadgeStyleNumber style
 */
- (void)jk_showNewBadge;
- (void)jk_showNewBadgeBySizeType:(LFBadgeSizeType)sizeType;
- (void)jk_showNewBadgeByStyle:(LFBadgeStyle)style;
- (void)jk_showNewBadgeByStyle:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType;

/**
 * show badge with showNumberBadgeWithValue style
 */
- (void)jk_showNumberBadge:(NSInteger)value;
- (void)jk_showNumberBadge:(NSInteger)value sizeType:(LFBadgeSizeType)sizeType;
- (void)jk_showNumberBadge:(NSInteger)value style:(LFBadgeStyle)style;
- (void)jk_showNumberBadge:(NSInteger)value style:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType;

/**
 *  clear badge
 */
- (void)jk_clearBadge;

/**
 *  get current badgeType
 */
- (LFBadgeType)jk_getBadgeType;

/**
 *  get bage show
 *
 */

- (BOOL)jk_isShowBage;

@end
