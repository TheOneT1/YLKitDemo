//
//  UIButton+YLImgAnimation.m
//  AniationButton
//
//  Created by fs_work on 2017/5/25.
//  Copyright © 2017年 fs_work. All rights reserved.
//

#import "UIButton+YLImgAnimation.h"
#import "NGAudioPlayer.h"
static const CGFloat animateWithDuration  = 0.2f;
static const CGFloat transformScaleEnlarge = 1.2f;
static const CGFloat transformScaleShrink = 0.8;
static const CGFloat transformDelay = 0.f;

@implementation UIButton (YLImgAnimation)

- (void)selectedImageAnimation{
    
    [UIView animateWithDuration:animateWithDuration delay:transformDelay options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, transformScaleEnlarge, transformScaleEnlarge);
        
    } completion:^(BOOL finished) {
        self.selected = !self.selected;
        
        [UIView animateWithDuration:animateWithDuration animations:^{
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, transformScaleShrink, transformScaleShrink);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:animateWithDuration animations:^{
                self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            } completion:^(BOOL finished) {
                
            }];
            
        }];
        
    }];
    
    
}

- (void)settAnimationImgs:(NSArray *)imgs WithDuration:(CGFloat)duration WithDurationInfoFont:(CGFloat)fontSize WithMargin:(CGFloat)margin WithSpacing:(CGFloat)spacing WithUrl:(NSString *)url{
    
    
    [self setContentMode:UIViewContentModeCenter];
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    UIImage *img = [UIImage imageNamed:imgs.lastObject];
    [self setImage:img forState:normal];
    CGFloat img_w = ceil(img.size.width);
    NSMutableArray *imgsA = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i=0; i<imgs.count; i++) {
        UIImage *img = [UIImage imageNamed:imgs[i]];
        [imgsA addObject:img];;
    }
    self.imageView.animationImages = imgsA;
    self.imageView.animationRepeatCount = 100;
    self.imageView.animationDuration= 1;
   
    self.accessibilityIdentifier = url;

//    [self addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    NSString *titleText = [NSString stringWithFormat:@"%zd\"",(NSInteger)duration];
    [self setTitle:titleText forState:normal];
    CGRect bounds = [titleText boundingRectWithSize:CGSizeMake(LONG_MAX, LONG_MAX) options:
                     NSStringDrawingTruncatesLastVisibleLine |
                     NSStringDrawingUsesLineFragmentOrigin |
                     NSStringDrawingUsesFontLeading
                                         attributes:
                     [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil];
    
    CGFloat text_w = ceil(bounds.size.width);
    
    CGFloat total_w = img_w + spacing + text_w + 2*margin;
    
    CGFloat position = spacing / 2.0;

    CGRect rect = CGRectMake(self.frame.origin.x, self.frame.origin.y, total_w , self.frame.size.height);
    
    [self setFrame:rect];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -position, 0, position)];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, position, 0, -position)];
 
}
//-(void)playAudio{
//    
//    if (![self isEqual:_audioButton])
//    {
//        [_audioButton.imageView stopAnimating];
//        
////        [_audioButton setImage:[UIImage imageNamed:@"zhuce_btn_yuyinshili.png"] forState:UIControlStateNormal];
//    }
//    
//    [NGAudioPlayer playAudioWithUrl:[NSURL URLWithString:self.accessibilityIdentifier] palyBlock:^(BOOL isPaly) {
//        [self setAnimation:YES];
//    } pauseBlock:^(BOOL isPasue) {
//        [self setAnimation:NO];
//        
//    } finishBlock:^(BOOL isFinish) {
//        [self setAnimation:NO];
//    }];
//    
//    _audioButton = self;
//}
//
//- (void)setAnimation:(BOOL)play{
//    if (play) {
//        [self.imageView startAnimating];
//    }else{
//        [self.imageView stopAnimating];
//    }
//}

@end
