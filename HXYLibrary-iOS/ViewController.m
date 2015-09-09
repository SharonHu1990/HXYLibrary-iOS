//
//  ViewController.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "ViewController.h"
#import "AppUtils.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    self.myWebView.delegate = self;
    [AppUtils showLoadingHUDOnView:self.myWebView withLabelText:nil];
}



-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [AppUtils showCompletedHUDOnView:self.myWebView
                       withLableText:@"加载完成"
                      completedBlock:^{
                          DLog(@"Over");
                      }
                           showImage:NO
     ];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [AppUtils showCompletedHUDOnView:self.myWebView
                       withLableText:@"加载失败"
                      completedBlock:^{DLog(@"Over");}
                           showImage:NO];
}
@end
