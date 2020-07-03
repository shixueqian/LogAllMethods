//
//  Student.m
//  LogAllMethods
//
//  Created by 石学谦 on 2020/5/28.
//  Copyright © 2020 shixueqian. All rights reserved.
//

#import "Student.h"

@interface Student ()
{
    BOOL _isHandsome;
}

@property (nonatomic,copy)NSString *name;

@end

@implementation Student

- (void)study:(NSString *)subject {
    NSLog(@"学习%@",subject);
}

- (int)addA:(int)a andB:(int)b {
    return a + b;
}

+ (void)running {
    NSLog(@"跑步去了");
}

@end
