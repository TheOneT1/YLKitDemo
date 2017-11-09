//
//  UIButton+DelayClick.h
//  YLButtonAboutDelay
//
//  Created by ffss on 2017/11/8.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DelayClick)
@property (nonatomic,assign)NSTimeInterval timeInterval;
@property (nonatomic,assign)BOOL isIgnoreEvent;
@end
