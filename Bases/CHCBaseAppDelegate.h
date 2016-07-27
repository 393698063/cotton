//
//  HCBaseAppdelegate.h
//  FoodYou
//
//  Created by Lemon-HEcom on 15/9/7.
//  Copyright (c) 2015年 AZLP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCBaseViewController.h"

@interface CHCBaseAppDelegate : UIResponder <UIApplicationDelegate>
{
  UIWindow *iWindow;
}
@property (strong, nonatomic) UIWindow *iWindow;


- (UIViewController *)getFirstViewController;

@end
