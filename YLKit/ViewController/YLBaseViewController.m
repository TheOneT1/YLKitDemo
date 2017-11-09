//
//  YLBaseViewController.m
//  P009_01
//
//  Created by fs_work on 2017/5/25.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//
#define TITLE_COLOR [UIColor blackColor]
#define LEFTBUTTON_COLOR [UIColor blackColor]
#define RIGHTBUTTON_COLOR [UIColor blackColor]
#define NAVLEFTBUTTONIMG @"nav_back_icon"

#define NavButtonMinWidth 80
#define NavButtonLeftOffSet 15
#define NavButtonRightOffSet 15
#import "YLBaseViewController.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
#import "UIButton+YLPosition.h"

@interface YLBaseViewController ()

@end

@implementation YLBaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(id)init{
    self = [super init];
    AppDelegate *kdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (kdelegate.reach == NO ) {
        [Dialog toastCenter:@"似乎已断开与互联网的连接"];
        return nil;
    }else{
        return self;
    }
    
}
-(UIView *)statusBarView{
    
    if (!_statusBarView) {
        _statusBarView = [[UIView alloc] initWithFrame:CGRectMake(_statusBarView.frame.origin.x, _statusBarView.frame.origin.y, _statusBarView.frame.size.width, YL_SAFEAREA_STATUS_HEIGHT)];
        [_statusBarView setBackgroundColor:[UIColor clearColor]];
    }
    
    return _statusBarView;
}

-(UIView *)navView{
    
    if (!_navView) {
        _navView = [[UIImageView alloc]initWithFrame:CGRectMake(0.f,0.f,SECREEN_SIZE.width,YL_SAFEAREA_NAV_HEIGHT)];
        _navView.backgroundColor = [UIColor whiteColor];
        _navView.image = [UIImage imageNamed:@"nav_bg"];
        _navView.userInteractionEnabled = YES;

    }
    
    return _navView;
}

-(UIButton *)leftButton{
    
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, YL_SAFEAREA_STATUS_HEIGHT, 40, 40)];
        [_leftButton setTitleColor:LEFTBUTTON_COLOR forState:normal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        if (self.navigationController.viewControllers.count > 1) {
            [_leftButton setImage:[UIImage imageNamed:NAVLEFTBUTTONIMG] forState:normal];
        }
        [_leftButton addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftButton;
}

-(UILabel *)navTitleLabel{
    
    if (!_navTitleLabel) {
        _navTitleLabel = [[UILabel alloc] init];
        _navTitleLabel.frame = CGRectMake(80,YL_SAFEAREA_STATUS_HEIGHT, KSceenSize.width-160, YL_SAFEAREA_NAV_HEIGHT -YL_SAFEAREA_STATUS_HEIGHT);
        [_navTitleLabel setFont:[UIFont boldSystemFontOfSize:17.f]];
        [_navTitleLabel setTextAlignment:NSTextAlignmentCenter];
        _navTitleLabel.textColor = [UIColor whiteColor];
    }
    return _navTitleLabel;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(KSceenSize.width - 60.f, YL_SAFEAREA_STATUS_HEIGHT, 60.f, 44.f)];
        _rightButton.titleLabel.textAlignment= 2;
        [_rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    }
    
    return _rightButton;
}

- (UILabel *)botCuttingLine{
    if (!_botCuttingLine) {
        _botCuttingLine = [[UILabel alloc] initWithFrame:CGRectMake(0, YL_SAFEAREA_NAV_HEIGHT - 0.5, KSceenSize.width, 0.5)];
        _botCuttingLine.backgroundColor = [UIColor colorWithHex:0xE0E0E0 alpha:1];
        _botCuttingLine.hidden = YES;
        
    }
    return _botCuttingLine;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.statusBarView];
    
    [self.navView addSubview:self.navTitleLabel];
    [self.navView addSubview:self.leftButton];
    [self.navView addSubview:self.rightButton];
    
    [self.leftButton leftImageOffSet:15 WithMinWidth:80];
    [self.rightButton rightImageOffSet:15 WithMinWidth:50];
    
    [self.view insertSubview:self.navView belowSubview:self.statusBarView];
    [self.navView addSubview:self.botCuttingLine];
    [self.navView bringSubviewToFront:self.botCuttingLine];
        
}

- (void)leftAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightAction:(id)sender{
    // custom to do...
}

- (void)plusAction:(id)sender{
    // custom to do...
}

- (void)setLeftTitle:(NSString *)leftTitle{
    [self.leftButton setTitle:leftTitle forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)rightTitle{
     [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];
}

- (void)setLeftImgName:(NSString *)leftImgName{
    [self.leftButton setImage:[UIImage imageNamed:leftImgName] forState:UIControlStateNormal];
}

- (void)setRightImgName:(NSString *)rightImgName{
    [self.rightButton setImage:[UIImage imageNamed:rightImgName] forState:UIControlStateNormal];
}

-(void)setNavTitle:(NSString *)navTitle{
    self.navTitleLabel.text = navTitle;
}

#pragma mark - MJ刷新
- (void)setupRefresh:(UIScrollView*)tableView{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [tableView headerBeginRefreshing];
    [tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

@end
