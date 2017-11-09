//
//  YLWKWebBaseViewController.m
//  TZTT
//
//  Created by ffss on 2017/10/25.
//  Copyright © 2017年 Yanngyunlong. All rights reserved.
//

#import "YLWKWebBaseViewController.h"

@interface YLWKWebBaseViewController ()

@end

@implementation YLWKWebBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   self.wkWeb = [[WKWebView alloc] initWithFrame:CGRectMake(0, YL_SAFEAREA_NAV_HEIGHT, YL_SCREEN_WITTH, YL_SCREEN_HEIGHT - YL_SAFEAREA_JAW_HEIGHT - YL_SAFEAREA_NAV_HEIGHT)];
    [self.view addSubview:self.wkWeb];
    self.wkWeb.UIDelegate = self;
    self.wkWeb.navigationDelegate = self;
    [self.wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
}

- (void)leftAction:(id)sender{
    if (self.wkWeb.canGoBack) {
        [self.wkWeb goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.navTitle = webView.title;
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}

//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    YLURLParser *parser = [[YLURLParser alloc] initParserWithAbsoluteString:navigationAction.request.URL];
//    if (parser) {
//        if (parser.selectorName && parser.parameters) {
//            [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",parser.selectorName]) withObject:parser.parameters];
//        }else if(parser.selectorName){
//            [self performSelector:NSSelectorFromString(parser.selectorName)];
//        }else{
//        }
//
//        decisionHandler(WKNavigationActionPolicyCancel);
//        return;
//    }
//    decisionHandler(WKNavigationActionPolicyAllow);
//}

//// 接收到服务器跳转请求之后调用
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
//
//}
//// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    decisionHandler(WKNavigationResponsePolicyAllow);
//}
//// 在发送请求之前，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
//
//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
//    
//}
@end
