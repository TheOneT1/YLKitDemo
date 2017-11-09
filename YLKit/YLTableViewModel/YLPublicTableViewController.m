//
//  YLPublicTableViewController.m
//  ERY
//
//  Created by ffss on 2017/7/26.
//  Copyright © 2017年 SFB. All rights reserved.
//

#import "YLPublicTableViewController.h"

@interface YLPublicTableViewController ()

@end

@implementation YLPublicTableViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
// NSLog(@"xxxx1 = %@",self.xxx);
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"xxxx2 = %@",self.xxx);
//    // Do any additional setup after loading the view.
    
    
}

- (void)setYl_tableModel:(YLTableModel *)yl_tableModel{
    if (yl_tableModel) {
        self.yl_tableModel = yl_tableModel;
        [self.yl_tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
