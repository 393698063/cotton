//
//  QGFirstViewController.h
//  cotton
//
//  Created by HEcom on 16/7/27.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "CHCBaseViewController.h"

@interface QGMessageViewController : CHCBaseViewController

@end

@interface QGMessageController : CHCBaseController
@property (nonatomic,strong) NSMutableArray * iProgramsAry;
@property (nonatomic, strong) NSMutableArray * iListDataAry;
- (void)requestDefaultSectionsCompletion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion;
- (void)requestDefaultNewsWithPage:(NSString *)page
                        completion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion;
- (void)requestSectionNewsWithPage:(NSString *)page
                         sectionId:(NSString *)sectionId
                             index:(NSInteger)index
                        completion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion;
@end

@interface QGMessageProgramNameVO : CHCBaseVO
@property (nonatomic, copy) NSString * sectionID;
@property (nonatomic, copy) NSString * sectionName;
@end
