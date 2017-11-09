//
//  YLBaseViewController.h
//  P009_01
//
//  Created by fs_work on 2017/5/25.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetApi.h"
@interface YLBaseViewController : UIViewController
@property(nonatomic,strong)UIImageView      *navView;
@property(nonatomic,strong)UIView      *statusBarView;
@property(nonatomic,strong)UIButton    *leftButton;
@property(nonatomic,strong)UIButton    *rightButton;
@property(nonatomic,strong)UILabel     *navTitleLabel;
@property(nonatomic,strong)UILabel     *botCuttingLine;

@property (nonatomic,copy)NSString *navTitle;
@property (nonatomic,copy)NSString *leftImgName;
@property (nonatomic,copy)NSString *rightImgName;
@property (nonatomic,copy)NSString *leftTitle;
@property (nonatomic,copy)NSString *rightTitle;

-(void)leftAction:(id)sender;
-(void)rightAction:(id)sender;
-(void)plusAction:(id)sender;
-(id)init;

- (void)setupRefresh:(UIScrollView*)tableView;
@end
