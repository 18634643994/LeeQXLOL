//
//  InformationViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationViewModel.h"

@implementation InformationViewModel

-(instancetype)initWithType:(InfoType)type
{
    if (self = [super init]) {
        _type = type;
    }return self;
}

//预防性编程，防止没有使用上方初始化
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithType出事化", __func__);
    }return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{       if (self.isHasMore) {
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}else{
    NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
    completionHandle(error);
}
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [InformationNetManager getInfoWithInfoType:_type Page:_page completionHandle:^(InfomationModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
//        _maxPage = model.thisPageNum.integerValue;
        completionHandle(error);
    }];
}
- (NSInteger)maxPage
{
    return 4;
}
- (BOOL)isHasMore
{
    return self.maxPage > _page;
}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (InfomationListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSURL *)iconURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].imageUrlBig];
}
- (NSString *)titleForRowInList:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)descForRowInList:(NSInteger)row
{
    return [self modelForRow:row].summary;
}
/**   此处需要改*/
- (NSString *)dataForRowInList:(NSInteger)row
{
  
    return [self modelForRow:row].publicationDate;
}
/** 返回列表的名字*/
- (NSString *)nameForRowInList:(NSInteger)row
{
    
    return [self modelForRow:row].channelDesc;
    
}
@end
