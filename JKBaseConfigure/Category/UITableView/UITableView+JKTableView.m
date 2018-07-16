//
//  UITableView+JKTableView.m
//  JKBaseProject
//
//  Created by Kang on 2018/7/12.
//  简书地址: https://www.jianshu.com/u/fae6c7ac5a9d
//  Copyright © 2018年 lanxiao. All rights reserved.
//

#import "UITableView+JKTableView.h"

@implementation UITableView (JKTableView)


//tableview隐藏横线
- (void)setExtraCellLineHidden{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    self.tableFooterView = view;
}

- (void)setTableViewAdjusts{
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
}


- (void)fitIphoneXScroll{
    self.contentInset = UIEdgeInsetsMake(0, 0, 34, 0);
}








- (void)updateWithBlock:(void (^)(UITableView *tableView))block {
    [self beginUpdates];
    block(self);
    [self endUpdates];
}

- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:row inSection:section];
    [self insertRowAtIndexPath:toInsert withRowAnimation:animation];
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    [self reloadRowAtIndexPath:toReload withRowAnimation:animation];
}

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toDelete = [NSIndexPath indexPathForRow:row inSection:section];
    [self deleteRowAtIndexPath:toDelete withRowAnimation:animation];
}

- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self insertSections:sections withRowAnimation:animation];
}

- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self deleteSections:sections withRowAnimation:animation];
}

- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:indexSet withRowAnimation:animation];
}

- (void)clearSelectedRowsAnimated:(BOOL)animated {
    NSArray *indexs = [self indexPathsForSelectedRows];
    [indexs enumerateObjectsUsingBlock:^(NSIndexPath* path, NSUInteger idx, BOOL *stop) {
        [self deselectRowAtIndexPath:path animated:animated];
    }];
}






























@end
