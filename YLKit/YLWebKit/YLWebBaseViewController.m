//
//  YLWebBaseViewController.m
//  P009_01
//
//  Created by ffss on 2017/6/30.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLWebBaseViewController.h"
#import "YLURLParser.h"
#import "FeedBackViewController.h"
#import "PBFunc.h"
#import "KMySelf+Right.h"
@interface YLWebBaseViewController ()<UIWebViewDelegate>

@end

@implementation YLWebBaseViewController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.web) {
        [self.web reload];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    if (self.isTopStart) {
        self.navView.backgroundColor = [UIColor clearColor];
        [self.leftButton setImage:[UIImage imageNamed:@"icon-webfanhui"] forState:UIControlStateNormal];
    }
    if (!self.web) {
        CGFloat topMargin = self.isTopStart?0:YL_SAFEAREA_NAV_HEIGHT;
        self.web = [[UIWebView alloc] initWithFrame:CGRectMake(0, topMargin, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height - topMargin)];
        if (@available(iOS 11.0, *)) {
            self.web.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        self.web.scrollView.bounces = NO;
        self.web.delegate = self;
        [self.view addSubview:self.web];
        if (self.isTopStart) {
            [self.view bringSubviewToFront:self.navView];
            self.botCuttingLine.hidden = YES;
        }
    }
    self.urlString = [NSString stringWithFormat:@"%@&isReviewing=%zd",self.urlString,[GlobalServerConfiguration iSReviewing]?1:0];;
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
}




-(void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD show];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
    self.navTitleLabel.text = [self.web stringByEvaluatingJavaScriptFromString:@"document.title"];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    YLURLParser *parser = [[YLURLParser alloc] initParserWithAbsoluteString:request.URL];
    if (parser) {
        
        if (parser.selectorName && parser.parameters) {
            [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",parser.selectorName]) withObject:parser.parameters];
        }else if(parser.selectorName){
            [self performSelector:NSSelectorFromString(parser.selectorName)];
        }else{
        }
        
        return  NO;
    }
    return YES;
}

- (void)backAction:(id)sender{
    if (self.web.canGoBack) {
        [self.web goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)leftAction:(id)sender{
    if (self.web.canGoBack) {
        [self.web goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }

}

- (void)pay:(id)sender{
    NSString *idx = sender[@"id"];
//    [KMySelf rechargeWithID:idx WithPage:self WithType:corn];
    
}

- (void)payVip:(id)sender{
    NSString *idx = sender[@"id"];
//    [KMySelf rechargeWithID:idx WithPage:self WithType:memeber];
    
}

- (void)feedback{
    FeedBackViewController *vc = [[FeedBackViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
