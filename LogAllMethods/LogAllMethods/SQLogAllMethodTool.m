//
//  SQLogAllMethodTool.m
//  LogAllMethods
//
//  Created by 石学谦 on 2020/5/28.
//  Copyright © 2020 shixueqian. All rights reserved.
//

#import "SQLogAllMethodTool.h"
#import <objc/runtime.h>

#define NSLog(format, ...) printf("%s%s %s\n",__DATE__,__TIME__,[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])

@implementation SQLogAllMethodTool

#pragma mark - 对象方法

//打印当前Class的对象方法
+ (void)LogInstanceMethodsForClass:(Class)cls {
    
    NSLog(@"------------ %@ ---------------",NSStringFromClass(cls));
    u_int count;
    //打印Class的所有对象方法列表
    Method *methodList = class_copyMethodList(cls,&count) ;
    for (int i = 0; i < count; i++) {
        
        Method method = methodList[i];
        
        SEL sel = method_getName(method);
        NSString *name = NSStringFromSelector(sel);
        
        //所有方法至少都会有两个参数，self和_cmd
        //参数个数：不包括返回值的个数，至少会有两个
        int arguments = method_getNumberOfArguments(method);
        //编码方式:不需要管数字，前面一个是返回值，第二个为self(@0)，第三个为_cmd(:8),后面的才是真正的参数类型
        const char *typeEncoding = method_getTypeEncoding(method);
        
        NSLog(@"对象方法：%@,参数个数：%d,编码方式：%s",name,arguments,typeEncoding);
    }
    free(methodList);
}
//打印Class的所有对象方法
+ (void)LogAllInstanceMethodsForClass:(Class)cls {
    
    if (!cls) {return;}
    
    //打印当前类的对象方法
    [self LogInstanceMethodsForClass:cls];
    
    //沿继承链递归查找父类的对象方法
    Class superClass = class_getSuperclass(cls);
    [self LogAllInstanceMethodsForClass:superClass];
}

#pragma mark - 类方法

//打印当前Class的类方法
+ (void)LogClassMethodsForClass:(Class)cls
{
    NSLog(@"------------ %@ ---------------",NSStringFromClass(cls));
    u_int count;
    Method *methodList = class_copyMethodList(object_getClass(cls),&count) ;
    for (int i = 0; i < count; i++) {
        
        Method method = methodList[i];
        SEL sel = method_getName(method);
        int arguments = method_getNumberOfArguments(method);
        const char *typeEncoding = method_getTypeEncoding(method);
        
        NSLog(@"类方法：%@,参数个数：%d,编码方式：%s",NSStringFromSelector(sel),arguments,typeEncoding);
    }
    free(methodList);
}

//打印Class的所有类方法
+ (void)LogAllClassMethodsForClass:(Class)cls
{
    if (!cls) {return;}
    //打印当前Class的类方法
    [self LogClassMethodsForClass:cls];
    //沿继承链递归查找父类的类方法
    Class superClass = class_getSuperclass(cls);
    [self LogAllClassMethodsForClass:superClass];
}

#pragma mark - 属性

//打印当前Class的属性
+ (void)LogPropertiesForClass:(Class)cls {
    
    NSLog(@"------------ %@ ---------------",NSStringFromClass(cls));
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        const char *property_name = property_getName(property);
        const char *property_attr = property_getAttributes(property);
        const char *propertyType = property_copyAttributeValue(property, "T");
        const char *property_Value = property_copyAttributeValue(property, "V");
        
        NSLog(@"属性名：%s, 类型：%s, 成员变量名：%s, 描述:%s",property_name,propertyType,property_Value,property_attr);
    }
    free(properties);
}

//打印Class所有的属性
+ (void)LogAllPropertiesForClass:(Class)cls {
    
    if (!cls) {return;}
    //打印当前Class的属性
    [self LogPropertiesForClass:cls];
    //沿继承链递归查找父类的属性
    Class superClass = class_getSuperclass(cls);
    [self LogAllPropertiesForClass:superClass];
}

#pragma mark - Ivar

//打印当前Class的成员变量
+ (void)logIvarListForClass:(Class)cls {
    
    NSLog(@"------------ %@ ---------------",NSStringFromClass(cls));
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"成员变量名：%s 类型：%s 偏移量：%td",name,type,offset);
    }
    free(ivars);
}
//打印Class所有的成员变量
+ (void)logAllIvarListForClass:(Class)cls {
    
    if (!cls) {return;}
    //打印当前类的成员变量
    [self logIvarListForClass:cls];
    //沿继承链递归查找父类的成员变量
    Class superClass = class_getSuperclass(cls);
    [self logAllIvarListForClass:superClass];
}

@end
