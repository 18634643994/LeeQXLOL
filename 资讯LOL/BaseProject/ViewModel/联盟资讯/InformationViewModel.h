//
//  InformationViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "InformationNetManager.h"
@interface InformationViewModel : BaseViewModel

- (instancetype)initWithType:(InfoType)type;
@property(nonatomic) InfoType type;

/** 行数*/
@property(nonatomic) NSInteger rowNumber;

/** 返回列表中某一行数据的题目*/
- (NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述*/
- (NSString *)descForRowInList:(NSInteger)row;
/** 返回列表中分钟数*/
- (NSString *)dataForRowInList:(NSInteger)row;
/** 返回列表中某行的图片*/
- (NSURL *)iconURLForRowInList:(NSInteger)row;

//当前的页数
@property(nonatomic)NSInteger page;
//当前最大页数
@property(nonatomic)NSInteger maxPage;






@end
