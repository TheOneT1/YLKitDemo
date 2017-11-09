//
//  YLBaseCollectionViewController.h
//  miaotu
//
//  Created by ffss on 2017/8/17.
//  Copyright © 2017年 miaotu. All rights reserved.
//


#import "YLCollectionModel.h"
#import "NullCollectionView.h"
#import "YLBaseViewController.h"
@interface YLBaseCollectionViewController : YLBaseViewController
@property (nonatomic,strong) NullCollectionView *cellectionView;
@property (nonatomic,strong) YLCollectionModel *yl_collectionModel;
@end
