
//  QGFirstViewController.m
//  cotton
//
//  Created by HEcom on 16/7/27.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "QGMessageViewController.h"
#import "AFHTTPSessionManager.h"

@interface QGMessageViewController ()
@property  (nonatomic, strong) QGMessageController * iController;
@end

@implementation QGMessageViewController
@dynamic iController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = [UIColor redColor];
  [self.iController testTheUrl];
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

@interface QGMessageController ()
@property (nonatomic, strong) AFHTTPSessionManager * iSessionManager;
@end

@implementation QGMessageController

- (void)testTheUrl
{

  NSString * method = [NSString stringWithFormat:@"%@",@"api/news/getDefaultNews.action"];
  [self.iModelHandler getMethod:method
parameters:@{@"page":@"0"} comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData) {
  
}];
}

@end
