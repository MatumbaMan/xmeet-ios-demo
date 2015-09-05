//
//  ViewController.m
//  xmeet-ios-demo
//
//  Created by HouKinglong on 15/9/5.
//  Copyright (c) 2015年 HouKinglong. All rights reserved.
//

#import "ViewController.h"
#import "XmeetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    XmeetViewController * xmeet = [[XmeetViewController alloc]init];
    [xmeet setShowType:YES];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:xmeet];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
