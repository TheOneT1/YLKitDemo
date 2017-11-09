//
//  YLTableViewController.h
//  P009_01
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//



#import "YLBaseViewController.h"
#import "YLTableModel.h"
#import "NullTableView.h"

@interface YLTableViewController : YLBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)  NullTableView *yl_tableView;
@property (nonatomic, strong)  YLTableModel *yl_tableModel;
@end
