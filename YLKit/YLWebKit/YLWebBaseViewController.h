//
//  YLWebBaseViewController.h
//  P009_01
//
//  Created by ffss on 2017/6/30.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLBaseViewController.h"

@interface YLWebBaseViewController : YLBaseViewController
@property (nonatomic,strong) UIWebView *web;
@property (nonatomic, copy)  NSString*urlString;
@property (nonatomic,strong) NSString *webDataString;
@property (nonatomic, assign) BOOL isTopStart;
@end




