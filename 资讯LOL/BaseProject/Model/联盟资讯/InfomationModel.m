//
//  InfomationModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InfomationModel.h"

@implementation InfomationModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [InfomationListModel class]};
}
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    
    if ([propertyName isEqualToString:@"thisPageNum"]) {
        //    驼峰转下划线（loveYou -> love_you）
        return [propertyName underlineFromCamel];
    }
    return propertyName;
}
@end
@implementation InfomationListModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"score"] || [propertyName isEqualToString:@"summary"] || [propertyName isEqualToString:@"targetid"]|| [propertyName isEqualToString:@"title"]) {
        return propertyName;
    }
    return [propertyName underlineFromCamel];
}

@end


