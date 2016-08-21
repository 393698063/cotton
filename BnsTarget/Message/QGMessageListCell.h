//
//  QGMessageListCell.h
//  cotton
//
//  Created by jorgon on 21/08/16.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGMessageListVO.h"

@interface QGMessageListCell : UITableViewCell
+ (id)messageListCellWithTableView:(UITableView *)tableView;
- (void)loadData:(QGMessageListVO *)av0;
@end
