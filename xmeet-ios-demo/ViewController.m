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

@property (nonatomic, strong) UIButton * mXmeetPushButton;
@property (nonatomic, assign) int mIndex;
@property (nonatomic, assign) BOOL mType;

@property (nonatomic, strong) UIWebView * mWebView;

@end

#define MAX_COLOR 244
#define MIN_COLOR 69

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    
    _mWebView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_mWebView];
    
    NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://meet.xpro.im"]];
    [_mWebView loadRequest:req];
    
    float width = self.view.frame.size.width;
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(6, 6, 6, 6);
    _mIndex = 0;
    _mType = YES;
    
    _mXmeetPushButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 80, 200, 60, 60)];
    _mXmeetPushButton.layer.cornerRadius = 30;
    [_mXmeetPushButton setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    _mXmeetPushButton.imageEdgeInsets = imageInsets;
    [_mXmeetPushButton addTarget:self action:@selector(toXmeet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mXmeetPushButton];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(width - 80, 260, 60, 20)];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"Demo按钮";
    label.textColor = [UIColor purpleColor];
    [self.view addSubview:label];
    
    [self startTimer];
}

- (UIColor *)getColor {
    if (_mType) {
        _mIndex ++;
    } else {
        _mIndex --;
    }
    
    if (_mIndex == 4 || _mIndex == 0)
        _mType = !_mType;
    
    return [UIColor colorWithRed:(float)(_mIndex * 40 + 69.0)/255.0 green:103.0/255.0 blue:244.0/255.0 alpha:1.0];
}

- (void)startTimer {
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeButtonStyle) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)changeButtonStyle {
    _mXmeetPushButton.layer.backgroundColor = [self getColor].CGColor;
}


- (void)toXmeet {
    XmeetViewController * xmeet = [[XmeetViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:xmeet];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
