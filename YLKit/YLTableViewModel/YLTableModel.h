//
//  YLTableModel.h
//  P009_01
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//


typedef NS_ENUM(NSUInteger,yl_tableStyle) {
    YLTableViewStylePlain,          // regular table view
    YLTableViewStyleGrouped
};
typedef void (^YLTableViewCellDidSelected) (NSIndexPath* indexPath);
typedef void (^ YLCellActionTriger)(id objc);

#import <Foundation/Foundation.h>
@class YLTableHeaderModel,YLSectionModel,YLCellModel;
@interface YLTableModel : NSObject

@property (nonatomic, assign)  yl_tableStyle yl_tableStyle;
@property (nonatomic, strong)  UIView* yl_header;
@property (nonatomic, strong)  UIView* yl_footer;
@property (nonatomic, strong)  UIView* nullBgView;
@property (nonatomic, strong)  NSMutableArray <YLSectionModel *>* sections;
@property (nonatomic, copy)    YLTableViewCellDidSelected cellDidSelected;
@end


@interface YLTableHeaderModel: NSObject
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong)  UIView *headerView;
@end

@interface YLSectionModel : NSObject
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) UIView *sectionHeader;
@property (nonatomic, strong) UIView *sectionFooter;
@property (nonatomic, strong) NSMutableArray <YLCellModel *> * cells;

@end



@interface YLCellModel : NSObject
@property (nonatomic, strong) id model;
@property (nonatomic, copy)   NSString* idf;
@property (nonatomic, assign) BOOL cellClassIsNotNib;
@property (nonatomic, copy)   YLCellActionTriger cellAction;
@property (nonatomic, copy)   NSString *ext;
@property (nonatomic, strong) id exts;

@end
