
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
//  NSString * method = [NSString stringWithFormat:@"%@",@"saveSelectedSections.action"];
  self.iSessionManager = [AFHTTPSessionManager manager]; //alloc] initWithBaseURL:[NSURL URLWithString:@"http://dc.cncotton.com/mobileapp"]];
////  AFHTTPResponseSerializer * responseSerializer = [AFHTTPResponseSerializer serializer];
////  [self.iSessionManager setResponseSerializer:responseSerializer];
  NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet: self.iSessionManager.responseSerializer.acceptableContentTypes];
  [acceptableContentTypes addObject:@"text/html"];
  [acceptableContentTypes addObject:@"text/plain"];
  [acceptableContentTypes addObject:@"application/json"];
  self.iSessionManager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
//  [self.iSessionManager GET:@"http://dc.cncotton.com/mobileapp/api/news/getDefaultNews.action"
//                 parameters:@{@"page":@"0"}
//                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject)
//  {
//    NSString * jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//   
//    NSError *err;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&err];
//    HCLog(@"%@",jsonStr);
//    HCLog(@"%@",dic);
//  }
//                    failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error)
//  {
//    
//  }];
  NSString * method = [NSString stringWithFormat:@"%@",@"api/news/getDefaultNews.action"];
  [self.iModelHandler getMethod:method
parameters:@{@"page":@"0"} comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData) {
  
}];
//  NSString * method = [NSString stringWithFormat:@"%@",@"saveSelectedSections"];
//  [self.iModelHandler postMethod:method parameters:@{@"sectionID":@"xwtj"} completion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData)
//  {
//    
//  }];
}

@end
