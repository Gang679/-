//
//  AppDelegate.m
//  穷游
//
//  Created by dc004 on 15/11/16.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FindViewController.h"
#import "PersonViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *first = [[ViewController alloc]init];
    first.view.backgroundColor = [UIColor orangeColor];
//     first.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"主页" image:[UIImage imageNamed:@"11"] tag:1];
//    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:first];
    
    FindViewController *second = [[FindViewController alloc]init];
    second.view.backgroundColor = [UIColor redColor];
//    second.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_icon_found_highlight"]tag:2];
    UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:second];
    
    PersonViewController *third = [[PersonViewController alloc]init];
    third.view.backgroundColor = [UIColor whiteColor];
//    second.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"33"]tag:3];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:third];
    
    
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    self.window.rootViewController = tabbar;
    [tabbar setViewControllers:@[navi,navi1,navi2] animated:NO];
    
    
//    ViewController *first = [[ViewController alloc]initWithNibName:@"First" bundle:nil];
//    UINavigationController *naviControl1 = [[UINavigationController alloc]initWithRootViewController:first];
//    FindViewController *find = [[FindViewController alloc]initWithNibName:@"Second" bundle:nil];
//    UINavigationController *naviControl2 = [[UINavigationController alloc]initWithRootViewController:find];
//    PersonViewController *person = [[PersonViewController alloc]initWithNibName:@"Thire" bundle:nil];
//    UINavigationController *naviControl3 = [[UINavigationController alloc]initWithRootViewController:person];
//    self.window = [[UIWindow alloc]init];
//   UITabBarController *tabbar = [[UITabBarController alloc]init];
//    tabbar.viewControllers = [NSArray arrayWithObjects:naviControl1,naviControl2,naviControl3, nil];
//    [tabbar setViewControllers:@[naviControl1,naviControl2,naviControl3] animated:YES];
//    self.window.rootViewController = tabbar;
//    //1.创建Window
//       self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//       self.window.backgroundColor = [UIColor whiteColor];
//    UITabBarController *tabbar = [[UITabBarController alloc]init];
//    tabbar.view.backgroundColor = [UIColor redColor];
//    self.window.rootViewController = tabbar;
//    UIViewController *c1=[[UIViewController alloc]init];
//        c1.view.backgroundColor=[UIColor grayColor];
//        c1.view.backgroundColor=[UIColor greenColor];
//        c1.tabBarItem.title=@"消息";
//        c1.tabBarItem =[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
//        c1.tabBarItem.badgeValue=@"123";
//        UIViewController *c2=[[UIViewController alloc]init];
//        c2.view.backgroundColor=[UIColor brownColor];
//        c2.tabBarItem.title=@"联系人";
//      c2.tabBarItem =[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//      UIViewController *c3=[[UIViewController alloc]init];
//       c3.tabBarItem.title=@"动态";
//       c3.tabBarItem =[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
//        UIViewController *c4=[[UIViewController alloc]init];
//        c4.tabBarItem.title=@"设置";
//        c4.tabBarItem =[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];
//       [tabbar setViewControllers:@[c1,c2,c3,c4] animated:YES];
    //2.设置Window为主窗口并显示出来
//     [self.window makeKeyAndVisible];
    return YES;
    }

-(void)tabbar
{
    
   
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "-01.__" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"__" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"__.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
