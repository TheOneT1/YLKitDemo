//
//  YLBaseCollectionViewController.m
//  miaotu
//
//  Created by ffss on 2017/8/17.
//  Copyright © 2017年 miaotu. All rights reserved.
//

#import "YLBaseCollectionViewController.h"
#import "define.h"
#import "YLCollectionViewCell.h"
#import "YLCollectionReusableView.h"
@interface YLBaseCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YLBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
- (void)setYl_collectionModel:(YLCollectionModel *)yl_collectionModel{
    _yl_collectionModel = yl_collectionModel;
    if (yl_collectionModel) {
        if (_cellectionView == nil) {
            _cellectionView = [[NullCollectionView alloc] initWithFrame:yl_collectionModel.yl_collectionFrame collectionViewLayout:yl_collectionModel.layout];
            _cellectionView.showsVerticalScrollIndicator = NO;
            _cellectionView.showsHorizontalScrollIndicator = NO;
            _cellectionView.backgroundColor = [UIColor whiteColor];
            _cellectionView.alwaysBounceVertical = YES;
            _cellectionView.dataSource = self;
            _cellectionView.delegate = self;
            [self.view addSubview:_cellectionView];
            
        }
        [_cellectionView reloadData];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    NSLog(@"_yl_collectionModel.sections.count = %zd",_yl_collectionModel.sections.count);
    if (_yl_collectionModel.sections.count == 0) {
        NullBgView *null = [[NullBgView alloc] initWithFrame:self.cellectionView.frame];
        null.nullImageName = @"kong_icon";
        null.nullMsg = @"没有更多内容";
        self.cellectionView.nullBackgroundView = null;
    }
    return _yl_collectionModel.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    YLCollectionSectionModel *sectionModel = _yl_collectionModel.sections[section];
//      NSLog(@"sectionModel.cells.count = %zd",sectionModel.cells.count);
    return sectionModel.cells.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YLCollectionSectionModel *sectionModel = _yl_collectionModel.sections[indexPath.section];
    YLCollectionCellModel *cellModel = sectionModel.cells[indexPath.row];
    if (cellModel.cellClassIsNotNib) {
        [collectionView registerClass:[NSClassFromString(cellModel.idf) class] forCellWithReuseIdentifier:cellModel.idf];
    }else{
        [collectionView registerNib:[UINib nibWithNibName:cellModel.idf bundle:nil] forCellWithReuseIdentifier:cellModel.idf];
    }
    YLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellModel.idf forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(setCellModel:)]) {
         cell.cellModel = cellModel;
    }
    return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    YLCollectionSectionModel *sectionModel = _yl_collectionModel.sections[indexPath.section];
     YLCollectionHeaderModel *headerModel = sectionModel.headerModel;
    if (kind == UICollectionElementKindSectionFooter) {
        headerModel = sectionModel.footerModel;
    }
    
    if (headerModel.cellClassIsNotNib) {
        [collectionView registerClass:[NSClassFromString(headerModel.idf) class]  forSupplementaryViewOfKind:kind  withReuseIdentifier:headerModel.idf];
    }else{
        [collectionView registerNib:[UINib nibWithNibName:headerModel.idf bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:headerModel.idf];
    }
    
    
    YLCollectionReusableView *cr = (YLCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerModel.idf forIndexPath:indexPath];
    if ([cr respondsToSelector:@selector(setModel:)]) {
         cr.model = headerModel;
    }
    return cr;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_yl_collectionModel.cellDidSelected) {
        _yl_collectionModel.cellDidSelected(indexPath);
    }
}

@end
