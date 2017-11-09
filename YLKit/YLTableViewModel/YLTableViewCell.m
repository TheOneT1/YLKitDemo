//
//  YLTableViewCell.m
//  P009_01
//
//  Created by fs_work on 2017/6/6.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLTableViewCell.h"

@implementation YLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.botline = [[UIView alloc] initWithFrame:CGRectMake(10, self.frame.size.height - 0.5, YL_SCREEN_WITTH - 10, 0.5)];
    self.botline.backgroundColor = [UIColor colorWithHex:0xdbdbdb alpha:1];
    self.botline.hidden = YES;
    [self addSubview:self.botline];
    [self bringSubviewToFront:self.botline];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
