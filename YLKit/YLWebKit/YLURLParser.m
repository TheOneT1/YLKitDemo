//
//  YLURLParser.m
//  P014
//
//  Created by ffss on 2017/7/12.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLURLParser.h"

@implementation YLURLParser


- (instancetype)initParserWithAbsoluteString:(NSURL *)url{
        NSLog(@"url = %@",url.absoluteString);
    if (self = [super init]) {
        
        if ([url.scheme isEqualToString:ProjectScheme]) {
            
            self.scheme = url.scheme;
            NSMutableDictionary *para = [[NSMutableDictionary alloc] init];
            NSArray *queriesComponts = [url.query componentsSeparatedByString:@"&"];
            for (NSString *compontstring in queriesComponts) {
                NSArray *queryKV = [compontstring componentsSeparatedByString:@"="];
                if ([queryKV count] ==2) {
                    NSString *key = [queryKV objectAtIndex:0];
                    NSString *value = [queryKV objectAtIndex:1];
                    if (key.length>0 && value.length>0) {
                        [para setObject:value forKey:key];
                    }
                }
            }
            
            if ([para count] > 0) {
                self.parameters = [para copy];
            }
            
            if (url.path.length > 0) {
                self.selectorName = [url.path substringFromIndex:1];
            }
            

        }else{
        
            return nil;
        }
       
    }
    NSLog(@"url = %@",url.absoluteString);
    NSLog(@"self.scheme  = %@",self.scheme);
    NSLog(@"self.parameters = %@",self.parameters);
    NSLog(@"self.selectorName = %@",self.selectorName);
    
    return self;
}
@end
