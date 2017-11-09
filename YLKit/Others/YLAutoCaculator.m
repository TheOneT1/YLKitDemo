//
//  YLAutoCaculator.m
//  NIM
//
//  Created by fs_work on 2017/2/22.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "YLAutoCaculator.h"

@implementation YLAutoCaculator

+ (NSInteger)linesOfRows:(NSInteger )rows TotalCount:(NSInteger)all{
    if (all < rows) {
        return 1;
    }
    return all % rows > 0 ? all / rows + 1 : all / rows;
}

@end
