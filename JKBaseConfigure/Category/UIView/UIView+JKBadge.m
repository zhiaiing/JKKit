//
//  UIView+JKBadge.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/13.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "UIView+JKBadge.h"
#import "UIView+JKAdd.h"
#import <objc/runtime.h>
#import "UIColor+JKExtend.h"



#define LF_BADGE_VIEW_REDDOT_WIDTH          ((sizeType == LFBadgeSizeTypeNormal) ? 8.0 : 8.0)
#define LF_BADGE_VIEW_HEIGHT                ((sizeType == LFBadgeSizeTypeNormal) ? 15.0 : 15.0)
#define LF_BADGE_VIEW_SAMLL_WIDTH           ((sizeType == LFBadgeSizeTypeNormal) ? 15.0 : 15.0)
#define LF_BADGE_VIEW_STANDARD_WIDTH        ((sizeType == LFBadgeSizeTypeNormal) ? 22.0 : 22.0)
#define LF_BADGE_VIEW_BIG_WIDTH             ((sizeType == LFBadgeSizeTypeNormal) ? 27.0 : 27.0)

#define LF_BADGE_VIEW_NEW_FONT              ((sizeType == LFBadgeSizeTypeNormal) ? 10.0 : 10.0)
#define LF_BADGE_VIEW_NUMBER_FONT           ((sizeType == LFBadgeSizeTypeNormal) ? 12.0 : 12.0)

static char badgeLabelKey;
static char badgeOriginXKey;
static char badgeOriginYKey;
static char badgeShowallNumbersKey;

@implementation UIView (JKBadge)


/**
 *  clear badge
 */
- (void)jk_clearBadge
{
    if(self.jk_badge)  self.jk_badge.hidden = YES;
}


#pragma mark -- private methods

- (void)jk_showRedDotBadge{
    [self jk_showRedDotBadgeByStyle:LFBadgeStyleNormal sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showRedDotBadgeBySizeType:(LFBadgeSizeType)sizeType{
    [self jk_showRedDotBadgeByStyle:LFBadgeStyleNormal sizeType:sizeType];
}

- (void)jk_showRedDotBadgeByStyle:(LFBadgeStyle)style{
    [self jk_showRedDotBadgeByStyle:style sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showRedDotBadgeByStyle:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType{
    [self configBadge:LFBadgeTypeRedDot style:style sizeType:sizeType value:0];
}

/* --showNewBadge -- */
- (void)jk_showNewBadge{
    [self jk_showNewBadgeByStyle:LFBadgeStyleNormal sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showNewBadgeBySizeType:(LFBadgeSizeType)sizeType{
    [self jk_showNewBadgeByStyle:LFBadgeStyleNormal sizeType:sizeType];
}

- (void)jk_showNewBadgeByStyle:(LFBadgeStyle)style{
    [self jk_showNewBadgeByStyle:style sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showNewBadgeByStyle:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType{
    [self configBadge:LFBadgeTypeNew style:style sizeType:sizeType value:0];
}

/* --showNumberBadge -- */
- (void)jk_showNumberBadge:(NSInteger)value{
    [self jk_showNumberBadge:value style:LFBadgeStyleNormal sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showNumberBadge:(NSInteger)value sizeType:(LFBadgeSizeType)sizeType{
    [self jk_showNumberBadge:value style:LFBadgeStyleNormal sizeType:sizeType];
}

- (void)jk_showNumberBadge:(NSInteger)value style:(LFBadgeStyle)style{
    [self jk_showNumberBadge:value style:style sizeType:LFBadgeSizeTypeNormal];
}

- (void)jk_showNumberBadge:(NSInteger)value style:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType{
    if (!self.jk_showAllNumbers && value <= 0) {
        [self jk_clearBadge];
        return;
    }
    [self configBadge:LFBadgeTypeNumber style:style sizeType:sizeType value:value];
}


//lazy loading
- (void)badgeInit
{
    if (nil == self.jk_badge) {
        
        [self setjk_badge:[[UILabel alloc] initWithFrame:CGRectZero]];
//        self.jk_badge = [[UILabel alloc] initWithFrame:CGRectZero];
        self.jk_badge.textAlignment = NSTextAlignmentCenter;
        self.jk_badge.backgroundColor = JKUIColorWithRGB(228,32,38);
        self.jk_badge.textColor = [UIColor whiteColor];
        self.jk_badge.text = @"";
        self.jk_badge.layer.cornerRadius = self.jk_badge.jk_width / 2;
        self.jk_badge.layer.masksToBounds = YES;//very important
        [self addSubview:self.jk_badge];
    }
}

- (void)configBadge:(LFBadgeType)type style:(LFBadgeStyle)style sizeType:(LFBadgeSizeType)sizeType value:(NSInteger)value{
    [self badgeInit];
    
    self.jk_badge.tag = type;
    
    switch (type) {
        case LFBadgeTypeRedDot:
        {
            self.jk_badge.text = @"";
            
            [self.jk_badge setjk_width:LF_BADGE_VIEW_REDDOT_WIDTH];
            [self.jk_badge setjk_height:LF_BADGE_VIEW_REDDOT_WIDTH];
//            self.jk_badge.jk_width = LF_BADGE_VIEW_REDDOT_WIDTH;
//            self.jk_badge.jk_height = LF_BADGE_VIEW_REDDOT_WIDTH;
        }
            break;
        case LFBadgeTypeNumber:
        {
            if (value >=100) {
                self.jk_badge.text = self.jk_showAllNumbers ? @(value).description : @"99+";
            } else {
                self.jk_badge.text = [NSString stringWithFormat:@"%@", @(value)];
            }
            
            if(value >= 100){
//                self.jk_badge.jk_width = LF_BADGE_VIEW_BIG_WIDTH;
                [self.jk_badge setjk_width:LF_BADGE_VIEW_BIG_WIDTH];
            }
            else if(value >= 10){
//                self.jk_badge.jk_width = LF_BADGE_VIEW_STANDARD_WIDTH;
                [self.jk_badge setjk_width:LF_BADGE_VIEW_STANDARD_WIDTH];
            }
            else{
//                self.jk_badge.jk_width = LF_BADGE_VIEW_SAMLL_WIDTH;
                [self.jk_badge setjk_width:LF_BADGE_VIEW_SAMLL_WIDTH];
            }
//            self.jk_badge.jk_height = LF_BADGE_VIEW_HEIGHT;
            [self.jk_badge setjk_height:LF_BADGE_VIEW_HEIGHT];
            self.jk_badge.font = [UIFont systemFontOfSize:LF_BADGE_VIEW_NUMBER_FONT];
        }
            break;
        case LFBadgeTypeNew:
        {
            self.jk_badge.text = @"new";
//            self.jk_badge.jk_width = LF_BADGE_VIEW_BIG_WIDTH;
//            self.jk_badge.jk_height = LF_BADGE_VIEW_HEIGHT;
            
            [self.jk_badge setjk_width:LF_BADGE_VIEW_BIG_WIDTH];
            [self.jk_badge setjk_height:LF_BADGE_VIEW_HEIGHT];
            
            self.jk_badge.font = [UIFont systemFontOfSize:LF_BADGE_VIEW_NEW_FONT];
        }
            break;
        default:
            break;
    }
    if(style == LFBadgeStyleNormal){
        self.jk_badge.center = CGPointMake(self.jk_width, 0);
    }
    else if(style == LFBadgeStyleCircle){
        CGFloat radius = self.jk_width/2;
        self.jk_badge.center = CGPointMake(ceil(radius + sqrt(2)/2*radius), ceil(radius - sqrt(2)/2*radius));
    }
    
    //*********自己定义的X Y*************//
    if([self hasBadgeOriginX]){
//        self.jk_badge.jk_left = self.jk_badgeOriginX;
        [self.jk_badge setjk_left:self.jk_badgeOriginX];
    }
    
    if([self hasBadgeOriginY]){
//        self.jk_badge.jk_top = self.jk_badgeOriginY;
        [self.jk_badge setjk_top:self.jk_badgeOriginY];
    }
    //********************************//
    
    self.jk_badge.layer.cornerRadius = self.jk_badge.jk_height / 2;
    self.jk_badge.hidden = NO;
}

#pragma mark -- setter/getter
- (UILabel *)jk_badge
{
    UILabel* lbl = objc_getAssociatedObject(self, &badgeLabelKey);
    if(lbl == nil) {
        lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        [self setjk_badge:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.backgroundColor = JKUIColorWithRGB(228,32,38);
        lbl.textColor = [UIColor whiteColor];
        lbl.text = @"";
        lbl.layer.masksToBounds = YES;//very important
        lbl.hidden = YES;
        [self addSubview:lbl];
    }
    return lbl;
}

- (void)setjk_badge:(UILabel *)label
{
    objc_setAssociatedObject(self, &badgeLabelKey, label, OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)hasBadgeOriginX{
    return objc_getAssociatedObject(self, &badgeOriginXKey) ? YES : NO;
}

-(CGFloat) jk_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &badgeOriginXKey);
    return number.floatValue;
}

-(void) setjk_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
//    self.jk_badge.jk_left = badgeOriginX;
    [self.jk_badge setjk_left:badgeOriginX];
}

- (BOOL)hasBadgeOriginY{
    return objc_getAssociatedObject(self, &badgeOriginYKey) ? YES : NO;
}

-(CGFloat) jk_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &badgeOriginYKey);
    return number.floatValue;
}

- (BOOL) jk_showAllNumbers{
    return objc_getAssociatedObject(self, &badgeShowallNumbersKey) ? YES : NO;
}

- (void) setjk_showAllNumbers:(BOOL)showAllNumbers{
    NSNumber *number = [NSNumber numberWithBool:showAllNumbers];
    objc_setAssociatedObject(self, &badgeShowallNumbersKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setjk_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
//    self.jk_badge.jk_top = badgeOriginY;
    [self.jk_badge setjk_top:badgeOriginY];
}

- (LFBadgeType)jk_getBadgeType{
    if(self.jk_badge){
        return [self.jk_badge tag];
    }
    return LFBadgeTypeRedDot;
}

- (BOOL)jk_isShowBage {
    
    return self.jk_badge.hidden;
}

@end
