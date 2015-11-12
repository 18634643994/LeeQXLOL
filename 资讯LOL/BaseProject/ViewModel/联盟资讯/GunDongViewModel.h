//
//  GunDongViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "InformationNetManager.h"
@interface GunDongViewModel : BaseViewModel
/** 返回有多少张图*/
@property(nonatomic)NSInteger rowNumber;
/** 返回图片的数据*/
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 返回图片的描述*/
- (NSString *)titleForRow:(NSInteger)row;
/** 判断次数*/
@property(nonatomic)NSInteger cishu;
@end
