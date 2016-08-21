//
//  QGMessageListView.m
//  cotton
//
//  Created by jorgon on 21/08/16.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#import "QGMessageListView.h"
#import "QGMessageListCell.h"
#import "QGMessageListVO.h"

@interface QGMessageListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * iTableView;
@property (nonatomic, strong) NSMutableArray * iDataAry;
@end

@implementation QGMessageListView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.iTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.iTableView.delegate = self;
        self.iTableView.dataSource = self;
        self.iTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.iTableView];
        
        self.iDataAry = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}
- (void)loadData:(NSArray *)dataAry
{
    [dataAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        QGMessageListVO * avo = [[QGMessageListVO alloc] initWithDic:obj];
        [self.iDataAry addObject:avo];
    }];
    [self.iTableView reloadData];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.iDataAry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QGMessageListCell * cell = [QGMessageListCell messageListCellWithTableView:tableView];
    QGMessageListVO * avo = [self.iDataAry objectAtIndex:indexPath.row];
    [cell loadData:avo];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
