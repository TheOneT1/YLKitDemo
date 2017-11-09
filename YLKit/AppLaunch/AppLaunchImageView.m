//
//  AppLaunchImageView.m
//  P009_01
//
//  Created by fs_work on 2017/6/1.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "AppLaunchImageView.h"

@implementation AppLaunchImageView

+ (instancetype)shareStance{
    static AppLaunchImageView *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[self alloc] init];
    });
    return share;
}

- (instancetype)init{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.image =  [self launchImage];
        self.userInteractionEnabled = YES;
        [self addSubview:self.tryAgainView];
    
    }
    return self;
}

- (UIButton *)tryAgainView{
    if (_tryAgainView == nil) {
        _tryAgainView = [UIButton buttonWithType:UIButtonTypeCustom];
        _tryAgainView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 60, [UIScreen mainScreen].bounds.size.width, 40);
        [_tryAgainView setTitle:@"网络好像开小差儿了~ 请重试" forState:UIControlStateNormal];
        [_tryAgainView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tryAgainView.backgroundColor = [UIColor grayColor];
        [_tryAgainView addTarget:self action:@selector(tryAgainClick) forControlEvents:UIControlEventTouchUpInside];
        _tryAgainView.userInteractionEnabled = YES;
    }
    return _tryAgainView;
}

- (void)tryAgainClick{
    if (self.handle) {
        self.handle();
    }
    
}

- (UIImage *)launchImage{
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = nil;
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)) {
        viewOrientation = @"Portrait";
    } else {
        viewOrientation = @"Landscape";
    }
    
    
    NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict){
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]){
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    return [UIImage imageNamed:launchImage];
    
}



@end
