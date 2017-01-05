//
//  UIColor+ColorType.m
//  MCLKit
//
//  Created by foscam on 16/12/27.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "UIColor+ColorType.h"

@implementation UIColor (ColorType)

+ (NSString *)Color:(UIColor *)c type:(COLORTYPE)t
{
    
    if (t == Text_Color) {
        return @"t_c";
    }
    if (t == Bg_Color) {
        
        return @"bg_c";
    }
    return nil;
}

@end
