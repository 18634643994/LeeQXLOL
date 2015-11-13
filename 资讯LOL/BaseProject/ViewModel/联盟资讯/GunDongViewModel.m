//
//  GunDongViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GunDongViewModel.h"

@implementation GunDongViewModel
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{   _cishu = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
//{
//    _cishu +=1;
//    [self getMoreDataCompletionHandle:completionHandle];
//}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [InformationNetManager getGunCompletionHandle:^(InfomationModel *model, NSError *error) {
       
        if (_cishu == 1) {
            [self.dataArr removeAllObjects];
        }
         [self.dataArr addObjectsFromArray:model.list];
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (InfomationListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
    
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].imageUrlBig];
}
@end
