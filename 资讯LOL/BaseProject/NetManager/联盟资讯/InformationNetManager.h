//
//  InformationNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface InformationNetManager : BaseNetManager
/** Num 切换  Page 第几个页面*/
+(id)getInfoWithNum:(NSInteger)num Page:(NSInteger)page kCompletionHandle;;
@end
