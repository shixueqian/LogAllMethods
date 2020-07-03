//
//  ViewController.m
//  LogAllMethods
//
//  Created by 石学谦 on 2020/5/28.
//  Copyright © 2020 shixueqian. All rights reserved.
//

#import "ViewController.h"
#import "SQLogAllMethodTool.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onclickBtn1:(id)sender {
    [SQLogAllMethodTool LogInstanceMethodsForClass:[Student class]];
}
- (IBAction)onclickBtn2:(id)sender {
    [SQLogAllMethodTool LogAllInstanceMethodsForClass:[Student class]];
}
- (IBAction)onclickBtn3:(id)sender {
    [SQLogAllMethodTool LogClassMethodsForClass:[Student class]];
}
- (IBAction)onclickBtn4:(id)sender {
    [SQLogAllMethodTool LogAllClassMethodsForClass:[Student class]];
}
- (IBAction)onclickBtn5:(id)sender {
    [SQLogAllMethodTool LogPropertiesForClass:[Student class]];
}
- (IBAction)onclickBtn6:(id)sender {
    [SQLogAllMethodTool LogAllPropertiesForClass:[Student class]];
}
- (IBAction)onclickBtn7:(id)sender {
    [SQLogAllMethodTool logIvarListForClass:[Student class]];
}
- (IBAction)onclickBtn8:(id)sender {
    [SQLogAllMethodTool logAllIvarListForClass:[Student class]];
}

@end
