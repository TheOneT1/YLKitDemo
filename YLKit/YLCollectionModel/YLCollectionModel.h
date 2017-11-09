//
//  YLCollectionModel.h
//  miaotu
//
//  Created by ffss on 2017/8/17.
//  Copyright © 2017年 miaotu. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^YLCollectionCellDidSelected) (NSIndexPath *indexPath);
typedef void(^YLCollectionCellActionTriger)(id objc);
typedef void(^YLCollectionCellHeaderActionTriger)(id objc);
@class YLCollectionHeaderModel,YLCollectionSectionModel,YLCollectionCellModel;
@interface YLCollectionModel : NSObject
@property (nonatomic, assign) CGRect yl_collectionFrame;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray <YLCollectionSectionModel *>* sections;
@property (nonatomic, copy)YLCollectionCellDidSelected cellDidSelected;
@end

@interface YLCollectionHeaderModel: NSObject
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy)  NSString* idf;
@property (nonatomic,assign) BOOL cellClassIsNotNib;
@property (nonatomic, strong) id model;
@property (nonatomic, copy)  YLCollectionCellHeaderActionTriger headerAction;

@end

@interface YLCollectionSectionModel : NSObject
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) YLCollectionHeaderModel *headerModel;
@property (nonatomic, strong) YLCollectionHeaderModel *footerModel;
@property (nonatomic, strong) NSMutableArray <YLCollectionCellModel *> * cells;

@end



@interface YLCollectionCellModel : NSObject
@property (nonatomic, strong) id model;
@property (nonatomic, copy)   NSString* idf;
@property (nonatomic, assign) BOOL cellClassIsNotNib;
@property (nonatomic, copy)   YLCollectionCellActionTriger cellAction;
@property (nonatomic, strong) id ext;

@end
