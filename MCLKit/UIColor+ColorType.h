//
//  UIColor+ColorType.h
//  MCLKit
//
//  Created by foscam on 16/12/27.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Text_Color,
    Bg_Color,
} COLORTYPE;

@interface UIColor (ColorType)

+ (NSString *)Color:(UIColor *)c type:(COLORTYPE)t;

@end
