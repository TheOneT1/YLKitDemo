//
//  YLWKWebBaseViewController.h
//  TZTT
//
//  Created by ffss on 2017/10/25.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import "YLBaseViewController.h"
#import <WebKit/WebKit.h>
@interface YLWKWebBaseViewController : YLBaseViewController<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, strong)WKWebView *wkWeb;
@property (nonatomic, copy) NSString *urlString;
@end
