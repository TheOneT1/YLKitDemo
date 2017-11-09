//
//  UIView+YLChain.h
//  ERY
//
//  Created by ffss on 2017/8/9.
//  Copyright © 2017年 SFB. All rights reserved.
//

/* Exmaple
 
 UIView *view = [[UIView alloc] init];
 [self.view addSubview:view];
 [view yl_makeView:^(YLViewMake *make) {
 make.yl_bgcolor([UIColor redColor]).yl_frame(CGRectMake(10, 10, 100, 100));
 }];
 
 
 */

#import <UIKit/UIKit.h>
@class YLViewMake;
@interface UIView (YLChain)

- (void)yl_makeView:(void(^)(YLViewMake *make))block;

@end




@interface YLViewMake : NSObject

@property (nonatomic,assign,readonly)CGRect frame;
@property (nonatomic,weak,readonly) UIColor *bgColor;
// ...
- (YLViewMake *(^)(UIColor *color))yl_bgcolor;
- (YLViewMake *(^)(CGRect rect))yl_frame;
// ...

@end
