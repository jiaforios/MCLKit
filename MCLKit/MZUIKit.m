//
//  MZUIKit.m
//  MCLKit
//
//  Created by foscam on 17/1/6.
//  Copyright © 2017年 zengjia. All rights reserved.
//

#import "MZUIKit.h"

@implementation MZUIKit

+ (void)configFormate:(NSString *)format
{
    NSArray *configArr = @[TC,BGC,FT,TAMT,TXT];
    NSString *frt = format;
    NSArray *frArr = [frt componentsSeparatedByString:@"-"];
    
    
}

+ (MZView *)configDataBlock:(NSDictionary *(^)())configBlock
{
    MZView *view = nil;
    NSDictionary *dic = configBlock();
    // 从字典中解析
    NSArray *keyArr = [dic allKeys];
    

   NSMutableArray *mArr = [keyArr mutableCopy];
   [mArr removeObjectsInArray:@[ALLOC,SUPERVIEW]];
   NSArray * configArr = mArr;
    
    if ([keyArr containsObject:ALLOC]) {
        view = (MZView *)[dic objectForKey:ALLOC];
        view.frame = CGRectMake(100, 100, 100, 100);
    }else
    {
        NSLog(@"未初始化类");
    }

    if ([keyArr containsObject:SUPERVIEW]) {
        id superObj = [dic objectForKey:SUPERVIEW];
        SEL sel = @selector(addSubview:);
        if ([view respondsToSelector:sel]) {
            IMP imp = [superObj methodForSelector:sel];
            void(*func)(id,SEL,id) = (void *)imp;
            func(superObj,sel,view);
        }
    }else
    {
        NSLog(@"未在MZUIKit中加入父视图");
    }
    
    
    [configArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id valueObj = [dic objectForKey:obj];
        
        if ([valueObj isKindOfClass:[NSNumber class]]) {
            
            NSNumber *vobj = (NSNumber *)valueObj;
            SEL sel = NSSelectorFromString(obj);
            if ([view respondsToSelector:sel]) {
                IMP imp = [view methodForSelector:sel];
                void(*func)(id,SEL,NSInteger)=(void*)imp;
                func(view,sel,[vobj integerValue]);
            }
            
        }else
        {
            SEL sel = NSSelectorFromString(obj);
            if ([view respondsToSelector:sel]) {
                IMP imp = [view methodForSelector:sel];
                void(*func)(id,SEL,id) = (void *)imp;
                func(view,sel,[dic objectForKey:obj]);
            }

            
        }
    }];
    
    return view;
}

@end
