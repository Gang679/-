//
//  WebViewController.m
//  穷游
//
//  Created by dc004 on 15/11/16.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "WebViewController.h"
#import "Masonry.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *Webview = [[UIWebView alloc]init];
    [self.view addSubview:Webview];
    [Webview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.right.equalTo(self.view).offset(0);
        make.width.equalTo(self.view.mas_width).offset(0);
        make.height.equalTo(self.view.mas_height).offset(0);

    }];
     UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [Webview addSubview:view];
    NSUserDefaults *Url = [NSUserDefaults standardUserDefaults];
   NSString *str = [Url valueForKey:@"bookr"];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [Webview loadRequest:request];
    
    //限制webview下拉功能
    for (id subview in Webview.subviews){
        if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).bounces = NO;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
