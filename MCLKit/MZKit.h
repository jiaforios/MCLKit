//
//  MZKit.h
//  MCLKit
//
//  Created by foscom on 16/12/2.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>

@interface MZKit : NSObject
@property(nonatomic,strong)id someObj;

/*
 * 初始化
 */

+ (MZKit*(^)(Class))initCls;

/*
 * 将子类添加到父类
 * 设置子类tag 值
 * 绑定子类与父类，在父类生命周期中全局访问
 *
 */


- (MZKit *(^)(id ,int ))addTo;

+ (id(^)(id ,int))fromTag;

/*
 * 结束标志 返回指定类型
 *
 */


- (id(^)())end;


@end
