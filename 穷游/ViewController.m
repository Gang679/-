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
@interface ViewController ()<UIScrollViewDelegate>
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
   self.navigationItem.title = @"穷游";
    self.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_found_highlight"];
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(turn)];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]init];
//    self.navigationItem.backBarButtonItem.title = @"返回";
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]  initWithTitle:@"推荐" style:UIBarButtonItemStylePlain target:self action:@selector(recommend)];
    UIBarButtonItem *bar1 = [[UIBarButtonItem alloc]  initWithTitle:@"目的地" style:UIBarButtonItemStylePlain target:self action:@selector(address)];
     UIBarButtonItem *bar2 = [[UIBarButtonItem alloc]  initWithTitle:@"社区" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    [self.navigationItem setLeftBarButtonItems:@[bar,bar1,bar2]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"登录"] style:UIBarButtonItemStylePlain target:self action:@selector(login)];
   
    [self http];
    [self view1];

}
-(void)view1
{
    UIView *recommend = [[UIView alloc]init];
    [self.view addSubview:recommend];
    UIView *address = [[UIView alloc]init];
    [self.view addSubview:address];
    UIView *community = [[UIView alloc]init];
    [self.view addSubview:community];
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
-(void)recommend
{
    
}
-(void)address
{
    
}
-(void)add
{
    
}
-(void)login
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
