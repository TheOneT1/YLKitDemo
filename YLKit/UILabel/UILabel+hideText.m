//
//  UILabel+hideText.m
//  ERY
//
//  Created by ffss on 2017/7/28.
//  Copyright © 2017年 SFB. All rights reserved.
//

#import "UILabel+hideText.h"

@implementation UILabel (hideText)

- (void)setHideText:(NSString *)hideText{
    if (hideText.length > 0) {
        self.text = hideText;
        self.hidden = NO;
    }else{
        self.hidden = YES;
    }
}
@end
