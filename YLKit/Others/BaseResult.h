//
//  BaseResult.h
//  miaotu
//
//  Created by ffss on 2017/8/29.
//  Copyright © 2017年 miaotu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface BaseResult : NSObject

@property (nonatomic, copy) NSString *server_time;

@property (nonatomic, assign) NSInteger err;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) id items;

@end
