//
//  SQLogAllMethodTool.h
//  LogAllMethods
//
//  Created by 石学谦 on 2020/5/28.
//  Copyright © 2020 shixueqian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQLogAllMethodTool : NSObject

//打印当前Class的对象方法
+ (void)LogInstanceMethodsForClass:(Class)cls;
//打印Class的所有对象方法
+ (void)LogAllInstanceMethodsForClass:(Class)cls;

//打印当前Class的类方法
+ (void)LogClassMethodsForClass:(Class)cls;
//打印Class的所有类方法
+ (void)LogAllClassMethodsForClass:(Class)cls;

//打印当前Class的属性
+ (void)LogPropertiesForClass:(Class)cls;
//打印Class所有的属性
+ (void)LogAllPropertiesForClass:(Class)cls;

//打印当前Class的成员变量
+ (void)logIvarListForClass:(Class)cls;
//打印Class所有的成员变量
+ (void)logAllIvarListForClass:(Class)cls;


@end

NS_ASSUME_NONNULL_END
