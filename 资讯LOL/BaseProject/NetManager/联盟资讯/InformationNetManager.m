//
//  InformationNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationNetManager.h"

@implementation InformationNetManager

+(id)getInfoWithInfoType:(InfoType)type Page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle
{
    switch (type) {
        case InfoTypeZuiXin: {
            NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c12_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeSaiShi: {
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c73_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeYueLe: {
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c18_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeGuanFang: {
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c3_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeMeiNv: {
            NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c17_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }

        case InfoTypeGonLve: {
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c10_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeHuoDong: {
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c23_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        default: {
            break;
        }
    }
}
+ (id)getGunCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = @"http://qt.qq.com/static/pages/news/phone/c13_list_1.shtml";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([InfomationModel objectWithKeyValues:responseObj], error);
    }];
}
@end
