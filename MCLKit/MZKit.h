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
+ (MZKit *(^)(NSString*))mzKit;
- (MZKit *(^)(NSString*))text;
- (MZKit *(^)(UIColor *))textColor;

- (id(^)())end;


@end
