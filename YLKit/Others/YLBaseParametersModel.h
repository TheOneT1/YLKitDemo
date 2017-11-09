//
//  YLBaseParametersModel.h
//  ERY
//
//  Created by ffss on 2017/8/3.
//  Copyright © 2017年 SFB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLBaseParametersModel : NSObject

@property (nonatomic,strong) NSNumber * limit;
@property (nonatomic,strong) NSNumber* page;

// model -> dictinoary
-  (NSDictionary *)dictinoary;

@end
