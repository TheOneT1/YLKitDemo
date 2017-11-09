//
//  YLTableModel.m
//  P009_01
//
//  Created by fs_work on 2017/6/5.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLTableModel.h"

@implementation YLTableModel

@end


@implementation YLTableHeaderModel

@end

@implementation YLSectionModel

- (instancetype)init{
    if (self = [super init]) {
        self.headerHeight = 0.001;
        self.footerHeight = 0.001;
    }
    return self;
}

@end

@implementation YLCellModel

@end
