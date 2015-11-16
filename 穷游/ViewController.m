//
//  ViewController.m
//  穷游
//
//  Created by dc004 on 15/11/16.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "WebViewController.h"
#define HTTPURL @"http://apis.baidu.com/qunartravel/travellist/travellist"
#define apikey @"a5a40555a97a82f733a225e18a1517a6"
#define httpArg @"query=%22%22&page=1"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    
    [self http];

}

-(void)http
{
    AFHTTPRequestOperationManager *Manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"%@?%@",HTTPURL,httpArg];
    [Manager.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
    [Manager GET:path parameters:nil
     success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
         NSDictionary *data = [responseObject valueForKey:@"data"];
         NSArray *books = [data valueForKey:@"books"];
         NSLog(@"%@",books);
         NSArray *book = [books valueForKey:@"bookUrl"];
         NSString *bookUrl = book[0];
         NSUserDefaults *Url = [NSUserDefaults standardUserDefaults];
         [Url setObject:bookUrl forKey:@"bookr"];
         UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         WebViewController *showWeb = [story instantiateViewControllerWithIdentifier:@"WebView"];
         [self presentViewController:showWeb animated:YES completion:^{
             NSLog(@"跳转web成功");
         }];

         
//         NSString *title = [books valueForKey:@"title"];
//         NSString *startTime = [books valueForKey:@"startTime"];
//         NSString *text = [books valueForKey:@"text"];
//         NSString *userName = [books valueForKey:@"userName"];
//         NSString *userHeadImg = [books valueForKey:@"userHeadImg"];
         
     } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
          NSLog(@"error = %@",error);
     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
