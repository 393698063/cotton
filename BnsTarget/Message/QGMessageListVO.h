//
//  QGMessageListVO.h
//  cotton
//
//  Created by jorgon on 21/08/16.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "CHCBaseVO.h"

@interface QGMessageListVO : CHCBaseVO
@property (nonatomic, copy) NSString * newsID;
@property (nonatomic, copy) NSString * newsName;
@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * url;
@end
