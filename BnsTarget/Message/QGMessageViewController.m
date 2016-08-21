
//  QGFirstViewController.m
//  cotton
//
//  Created by HEcom on 16/7/27.
//  Copyright © 2016年 Jorgon. All rights reserved.
//
#define kScreenSize [UIScreen mainScreen].bounds.size

#import "QGMessageViewController.h"
#import "QGMessageDefine.h"
#import "UIView+frame.h"
#import "UIColor+Hex.h"
#import "QGMessageListView.h"

@interface QGMessageViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *iTitleScroll;
@property (weak, nonatomic) IBOutlet UIScrollView *iContentScroll;

@property  (nonatomic, strong) QGMessageController * iController;
@property (nonatomic, weak) UIButton * iPreviousButton;
@end

@implementation QGMessageViewController
@dynamic iController;
- (void)creatObjsWhenInit
{
    [super creatObjsWhenInit];
    self.iTitleStr = @"中国棉花网";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = [UIColor redColor];
    __weak typeof(self)wSelf = self;
    [self.iController requestDefaultSectionsCompletion:^(BOOL isSucceed, NSString *aDesc)
    {
        if (isSucceed)
        {
            [wSelf setTitleContent];
            [wSelf setListDataAry];
            [wSelf initialListView];
            [wSelf getNewsRecommend];
        }
        else
        {
            [[CHCMessageView sharedMessageView] showInWindowsIsFullScreen:YES
                                                          withShowingText:aDesc
                                                        withIconImageName:nil];
        }
    }];
}
- (void)setTitleContent
{
    CGFloat width = self.iTitleScroll.width / 3;
    CGFloat height = self.iTitleScroll.height;
    [self.iController.iProgramsAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        QGMessageProgramNameVO * avo = obj;
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width * idx, 0, width, height);
        [button setTitle:avo.sectionName forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHex:0xff55a91d ] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = idx;
        [button addTarget:self action:@selector(programButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.iTitleScroll addSubview:button];
        if (idx == 0) {
            button.selected = YES;
            self.iPreviousButton = button;
        }
    }];
    self.iTitleScroll.contentSize = CGSizeMake(width * self.iController.iProgramsAry.count , height);
    self.iTitleScroll.showsHorizontalScrollIndicator = NO;
}

- (void)setListDataAry
{
    [self.iController.iListDataAry removeAllObjects];
    [self.iController.iProgramsAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray * dataAry = [NSMutableArray arrayWithCapacity:1];
        [self.iController.iListDataAry addObject:dataAry];
    }];
}
//初始化内容列表视图
- (void)initialListView
{
    [self.iContentScroll.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height - 64 - 44 - 49;
    [self.iController.iProgramsAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        QGMessageListView * view = [[QGMessageListView alloc] initWithFrame:CGRectMake(width * idx, 0, width, height)];
        view.tag = idx;
        [self.iContentScroll addSubview:view];
    }];
    self.iContentScroll.contentSize = CGSizeMake(width * self.iController.iProgramsAry.count, height);
}
- (void)getNewsRecommend
{
    /*
        如果登陆了，获取用户推荐列表
        如果未登录，获取默认列表；
     */
    __weak typeof(self)wSelf = self;
    [self.iController requestDefaultNewsWithPage:@"0" completion:^(BOOL isSucceed, NSString *aDesc)
    {
        if (isSucceed)
        {
            QGMessageListView * view = [wSelf.iContentScroll.subviews objectAtIndex:0];
            [view loadData:[wSelf.iController.iListDataAry objectAtIndex:0]];
        }
        else
        {
            [[CHCMessageView sharedMessageView] showInWindowsIsFullScreen:YES
                                                          withShowingText:aDesc
                                                        withIconImageName:nil];
        }
    }];
}
#pragma mark - 标题按钮点击事件
- (void)programButtonAction:(UIButton *)button
{
    if (button == self.iPreviousButton)
    {
        return;
    }
    else
    {
        [self.iPreviousButton setSelected:NO];
        [button setSelected:YES];
        self.iPreviousButton = button;
        if (!(self.iContentScroll.isTracking || self.iContentScroll.isDragging || self.iContentScroll.isDecelerating)) {
            self.iContentScroll.contentOffset = CGPointMake(kScreenSize.width * button.tag, 0);
        }
        NSArray * dataAry = [self.iController.iListDataAry objectAtIndex:button.tag];
        if (dataAry.count == 0) {
            [self requestSectionNewsWithPage:@"0" index:button.tag];
        }
        
    }
    
}
- (void)requestSectionNewsWithPage:(NSString *)page index:(NSInteger)index
{
    __weak typeof(self)wSelf = self;
    QGMessageProgramNameVO * nameVo = [self.iController.iProgramsAry objectAtIndex:index];
    [self.iController requestSectionNewsWithPage:page sectionId:nameVo.sectionID index:index
                                      completion:^(BOOL isSucceed, NSString *aDesc)
     {
         if (isSucceed)
         {
             QGMessageListView * view = [wSelf.iContentScroll.subviews objectAtIndex:index];
             [view loadData:[wSelf.iController.iListDataAry objectAtIndex:index]];
         }
         else
         {
             [[CHCMessageView sharedMessageView] showInWindowsIsFullScreen:YES
                                                           withShowingText:aDesc
                                                         withIconImageName:nil];
         }
     }];
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.iTitleScroll) {
        return;
    }
    NSInteger index = (scrollView.contentOffset.x + scrollView.width * 0.5)/scrollView.width;
    if (index > self.iController.iProgramsAry.count)
    {
        return;
    }
    UIButton * pragramButton = [self.iTitleScroll.subviews objectAtIndex:index];
    [self programButtonAction:pragramButton];
    [self.iTitleScroll scrollRectToVisible:CGRectMake(self.iTitleScroll.width/3 * index, 0, self.iTitleScroll.width/3, self.iTitleScroll.height)
                                  animated:YES];
}

- (IBAction)itemButtonAction:(id)sender
{
    
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

@end

@implementation QGMessageController
- (instancetype)init
{
    if (self = [super init]) {
        self.iProgramsAry = [NSMutableArray arrayWithCapacity:1];
        self.iListDataAry = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}
- (void)requestDefaultSectionsCompletion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion
{
    NSString * method = [NSString stringWithFormat:@"%@",QG_MessageDefaultSections];
    [self.iModelHandler getMethod:method parameters:@{} comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData)
    {
        NSError * aError = error;
        if (aFlag !=0 && !aError) {
            aError = [NSError errorWithDomain:aDesc code:0 userInfo:nil];
        }
        if (aError) {
            aCompletion(NO,[aError domain]);
        }
        else
        {
            [self.iProgramsAry removeAllObjects];
            [self constructDefaultProgrameNameData:(aData[@"data"])];
            aCompletion(YES,nil);
        }
    }];
}
- (void)constructDefaultProgrameNameData:(NSArray *)ary
{
    [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        QGMessageProgramNameVO * avo = [[QGMessageProgramNameVO alloc] initWithDic:obj];
        [self.iProgramsAry addObject:avo];
    }];
    QGMessageProgramNameVO * avo = [[QGMessageProgramNameVO alloc] init];
    avo.sectionID = @"";
    avo.sectionName = @"新闻推荐";
    [self.iProgramsAry insertObject:avo atIndex:0];
}
//请求默认新闻推荐
- (void)requestDefaultNewsWithPage:(NSString *)page
                        completion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion
{
    NSString * method = [NSString stringWithFormat:@"%@",QG_MessageDefaultNews];
    NSDictionary * param = @{@"page":page};
    [self.iModelHandler getMethod:method parameters:param comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData)
     {
         NSError * aError = error;
         if (aFlag !=0 && !aError) {
             aError = [NSError errorWithDomain:aDesc code:0 userInfo:nil];
         }
         if (aError) {
             aCompletion(NO,[aError domain]);
         }
         else
         {
             [self constructNewsWithIndex:0 data:aData[@"data"]];
             aCompletion(YES,nil);
         }
     }];
}

- (void)constructNewsWithIndex:(NSInteger)index data:(NSArray*)ary
{
    NSMutableArray * dataAry = [self.iListDataAry objectAtIndex:index];
    [dataAry addObjectsFromArray:ary];
}
- (void)requestSectionNewsWithPage:(NSString *)page
                         sectionId:(NSString *)sectionId
                             index:(NSInteger)index
                        completion:(void(^)(BOOL isSucceed,NSString * aDesc))aCompletion
{
    NSString * method = [NSString stringWithFormat:@"%@",QG_MessageSectionNews];
    NSDictionary * param = @{@"page":page,@"sectionID":sectionId};
    [self.iModelHandler getMethod:method parameters:param comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData)
     {
         NSError * aError = error;
         if (aFlag !=0 && !aError) {
             aError = [NSError errorWithDomain:aDesc code:0 userInfo:nil];
         }
         if (aError) {
             aCompletion(NO,[aError domain]);
         }
         else
         {
             [self constructNewsWithIndex:index data:aData[@"data"]];
             aCompletion(YES,nil);
         }
     }];
}
- (void)testTheUrl
{
    
    NSString * method = [NSString stringWithFormat:@"%@",@"api/news/getDefaultNews.action"];
    [self.iModelHandler getMethod:method
                       parameters:@{@"page":@"0"} comletion:^(NSInteger aFlag, NSString *aDesc, NSError *error, NSDictionary *aData) {
                           
                       }];
}

@end

@implementation QGMessageProgramNameVO



@end
