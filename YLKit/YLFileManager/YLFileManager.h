//
//  YLFileManager.h
//  NIM
//  参看： http://blog.csdn.net/lizhilin_vip/article/details/53185482
//  Created by fs_work on 2017/2/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

//Document 路径
#define YLFileDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
//Document 文件名字
#define YLFileDocumentPathWithName(fileName)   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName]

@interface YLFileManager : NSObject

@end
