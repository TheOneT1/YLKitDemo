//
//  AppLaunchImageView.h
//  P009_01
//
//  Created by fs_work on 2017/6/1.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

typedef void (^tryAgainBlock) ();

#import <UIKit/UIKit.h>

@interface AppLaunchImageView : UIImageView
@property (nonatomic, strong) UIButton *tryAgainView;
+ (instancetype)shareStance;
@property (nonatomic, copy)  tryAgainBlock handle;

@end
