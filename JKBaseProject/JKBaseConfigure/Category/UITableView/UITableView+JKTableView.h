//
//  UITableView+JKTableView.h
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (JKTableView)


//tableview隐藏横线
- (void)setExtraCellLineHidden;


- (void)setTableViewAdjusts;


- (void)fitIphoneXScroll;


- (void)updateWithBlock:(void (^)(UITableView *tableView))block;


- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;


- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)clearSelectedRowsAnimated:(BOOL)animated;


















@end
