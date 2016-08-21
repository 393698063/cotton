//
//  QGMessageDefine.h
//  cotton
//
//  Created by jorgon on 18/08/16.
//  Copyright © 2016年 Jorgon. All rights reserved.
//

#ifndef QGMessageDefine_h
#define QGMessageDefine_h

static NSString * const QG_MessageDefaultSections = @"api/news/getDefaultSections.action";//获取未登录状态下的默认栏目列表
static NSString * const QG_MessageMainNews = @"api/news/getMainNews.action";
static NSString * const QG_MessageDefaultNews = @"api/news/getDefaultNews.action";//获取未登录状态下首页我的推荐新闻列表
static NSString * const QG_MessageSectionNews = @"api/news/getSectionNews.action";//获取指定栏目的新闻列表
static NSString * const QG_MessageSelectedSections = @"api/news/getSelectedSections.action"; //获取当前用户已选择的栏目列表
static NSString * const QG_MessageAllSections = @"api/news/getAllSections.action";//获取所有的栏目列表
static NSString * const QG_MessageSaveSelectedSections = @"api/news/saveSelectedSections.action";//保存当前用户已选择的栏目列表
#endif /* QGMessageDefine_h */
