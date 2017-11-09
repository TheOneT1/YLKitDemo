//
//  YLTableViewController.m
//  P009_01
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLTableViewController.h"
#import "YLTableViewCell.h"

@interface YLTableViewController ()

@end

@implementation YLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.yl_tableView];
}

- (NullTableView *)yl_tableView{
    if (_yl_tableView == nil) {
        _yl_tableView = [[NullTableView alloc] initWithFrame:CGRectMake(0, YL_SAFEAREA_NAV_HEIGHT, KSceenSize.width, KSceenSize.height - YL_SAFEAREA_NAV_HEIGHT - YL_SAFEAREA_JAW_HEIGHT) style:UITableViewStyleGrouped];
        _yl_tableView.estimatedRowHeight = 80.f;
        _yl_tableView.backgroundColor = [UIColor colorWithHex:0xedf0f2 alpha:1];
        _yl_tableView.rowHeight =  UITableViewAutomaticDimension;
        _yl_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _yl_tableView.showsHorizontalScrollIndicator = NO;
        _yl_tableView.showsVerticalScrollIndicator = NO;
        _yl_tableView.delegate = self;
        _yl_tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _yl_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _yl_tableView;
}


- (void)setYl_tableModel:(YLTableModel *)yl_tableModel{
    _yl_tableModel = yl_tableModel;
    
    if (yl_tableModel.yl_header) {
        self.yl_tableView.tableHeaderView = yl_tableModel.yl_header;
    }
    
    if (yl_tableModel.yl_footer) {
        self.yl_tableView.tableFooterView = yl_tableModel.yl_footer;
    }
    
    [self.yl_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_yl_tableModel.sections.count > 0) {
        return  _yl_tableModel.sections.count;
    }else{
        return 0;
    }
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_yl_tableModel.sections.count > section) {
        YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[section];
        if (sectionModel.cells.count > 0) {
            return sectionModel.cells.count;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[indexPath.section];
    YLCellModel *cellModel = sectionModel.cells[indexPath.row];
    if (cellModel.cellClassIsNotNib) {
        [tableView registerClass:[NSClassFromString(cellModel.idf) class] forCellReuseIdentifier:cellModel.idf];
    }else{
        [tableView registerNib:[UINib nibWithNibName:cellModel.idf bundle:nil]forCellReuseIdentifier:cellModel.idf];
    }
    YLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.idf];
    if ([cell respondsToSelector:@selector(setCellModel:)]) {
        cell.cellModel = cellModel;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_yl_tableModel.cellDidSelected) {
        _yl_tableModel.cellDidSelected(indexPath);
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[section];
    // crash may be no YLSectionModel objc setted
    return sectionModel.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[section];
//    NSLog(@"sectionModel.footerHeight = %f",sectionModel.footerHeight);
    return sectionModel.footerHeight;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[section];
    return sectionModel.sectionHeader;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YLSectionModel *sectionModel = (YLSectionModel *)_yl_tableModel.sections[section];
    return sectionModel.sectionFooter;
}

@end
