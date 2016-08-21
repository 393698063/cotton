//
//  QGMessageListCell.m
//  cotton
//
//  Created by jorgon on 21/08/16.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "QGMessageListCell.h"

@interface QGMessageListCell ()
@property (weak, nonatomic) IBOutlet UILabel *iTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *iTimeLabel;
@end

@implementation QGMessageListCell

+ (id)messageListCellWithTableView:(UITableView *)tableView
{
    QGMessageListCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    }
    return cell;
}
- (void)loadData:(QGMessageListVO *)av0
{
    self.iTitleLabel.text = av0.newsName;
    self.iTimeLabel.text = av0.date;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
