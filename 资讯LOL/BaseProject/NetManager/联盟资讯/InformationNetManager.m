//
//  InformationNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationNetManager.h"
#import "InfomationModel.h"
@implementation InformationNetManager

+ (id)getInfoWithNum:(NSInteger)num Page:(NSInteger)page kCompletionHandle;
{
    NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c%ld_list_%ld.shtml",num,page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([InfomationModel objectWithKeyValues:responseObj], error);
    }];

}

@end
