//
//  YLTableViewCell.h
//  P009_01
//
//  Created by fs_work on 2017/6/6.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLTableModel.h"
@interface YLTableViewCell : UITableViewCell
@property (nonatomic, strong) YLCellModel *cellModel;
@property (nonatomic, strong) UIView *botline;
@end
