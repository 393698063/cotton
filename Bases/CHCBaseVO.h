//
//  CHCBaseVO.h
//  NewHopeForAgency
//
//  Created by HEcom-PC on 15/7/10.
//  Copyright (c) 2015年 Hecom. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const HC_BaseVO_Prefix_iHC = @"iHC";

@interface CHCBaseVO : NSObject
{
  NSDictionary *voDictionary;
}

@property (nonatomic, strong) NSDictionary *voDictionary;

-(NSDictionary *)fillVoDictionary;
- (instancetype)initWithDic:(NSDictionary *)aDataDic;
- (void)putValueFromDic:(NSDictionary *)aDataDic;
@end
