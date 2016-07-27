//
//  AppDelegate.m
//  cotton
//
//  Created by HEcom on 16/7/27.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "AppDelegate.h"
#import "QGFirstViewController.h"
#import "QGSecondViewController.h"
#import "QGThirdViewController.h"
#import "QGFourViewController.h"
#import "UIColor+Hex.h"
#import "AppDef.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  BOOL rtn = [super application:application didFinishLaunchingWithOptions:launchOptions];
  
  return rtn;
}
- (UIViewController *)getFirstViewController
{
  UIViewController * rtnVC = nil;
  rtnVC = [self creatTabbarController];
  return rtnVC;
}

#pragma mark get tabbar VC
- (UIViewController *)creatTabbarController
{
  UIViewController *rtnVC = nil;
  UITabBarController *aTabbarController = [[UITabBarController alloc]init];
  // [aTabbarController.tabBar setBackgroundColor:[UIColor colorWithHex:0xEFEFEF]];
  
  UIViewController *firstVC = [self createViewControllerWithClassName:NSStringFromClass([QGFirstViewController class])
                                                                title:NSLocalizedStringFromTable(@"Quatation", BnsTargetApp, nil)
                                                                image:@"quatation_nor" selectedImage:@"quatation_sel"];
  UIViewController *secondVC= [self createViewControllerWithClassName:NSStringFromClass([QGSecondViewController class])
                                                                title:NSLocalizedStringFromTable(@"Count", BnsTargetApp, nil)
                                                                image:@"count_nor" selectedImage:@"count_sel"];
  UIViewController *thirdVC = [self createViewControllerWithClassName:NSStringFromClass([QGThirdViewController class])
                                                                title:NSLocalizedStringFromTable(@"Professor", BnsTargetApp, nil)
                                                                image:@"expert_nor" selectedImage:@"exper_sel"];
  UIViewController *fourthVC= [self createViewControllerWithClassName:NSStringFromClass([QGFourViewController class])
                                                                title:NSLocalizedStringFromTable(@"Discover", BnsTargetApp, nil)
                                                                image:@"discover_nor" selectedImage:@"discover_sel"];
  
  NSMutableArray *viewControllers = [[NSMutableArray alloc]initWithObjects:
                                     firstVC,
                                     secondVC,
                                     thirdVC,
                                     fourthVC,
                                     nil];
  
  aTabbarController.viewControllers = viewControllers;
  // aTabbarController.delegate = self;
  rtnVC = aTabbarController;
  return rtnVC;
}
- (UIViewController *)createViewControllerWithClassName:(NSString *)className
                                                  title:(NSString *)titleStr
                                                  image:(NSString *)image
                                          selectedImage:(NSString *)selectedImage
{
  CHCBaseViewController * avc = [[NSClassFromString(className) alloc] init];
  //  avc.iTitleStr = titleStr;
  UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:avc];
  UIImage * tabItemImg = [UIImage imageNamed:image];
  UIImage * tabSelectImg = [UIImage imageNamed:selectedImage];
  NSString * tabbarTitle = titleStr;
  UITabBarItem * tabItem = [[UITabBarItem alloc] initWithTitle:tabbarTitle
                                                         image:tabItemImg
                                                 selectedImage:tabSelectImg];
  avc.navigationController.navigationBarHidden = YES;
  [self putTabbatItemAttributes:tabItem];
  nvc.tabBarItem = tabItem;
  return nvc;
}
- (void)putTabbatItemAttributes:(UITabBarItem *)aTabBarItem
{
  NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                              [UIColor colorWithHex:0xFF747474], NSForegroundColorAttributeName,
                              nil];
  [aTabBarItem setTitleTextAttributes:attributes
                             forState:UIControlStateNormal];
  
  NSDictionary *attributesSelect = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor colorWithHex:0xFFe15150], NSForegroundColorAttributeName,
                                    nil];
  [aTabBarItem setTitleTextAttributes:attributesSelect
                             forState:UIControlStateSelected];
  
  
  aTabBarItem.selectedImage = [aTabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  aTabBarItem.image = [aTabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
}

@end
