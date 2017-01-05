//
//  MZKit.m
//  MCLKit
//
//  Created by foscom on 16/12/2.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MZKit.h"
#import <objc/runtime.h>


@implementation MZKit
static MZKit *manger = nil;
+ (MZKit*(^)(Class))initCls
{
    return ^(Class cls){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manger = [MZKit new];
        });
        manger.someObj = [[cls alloc] init];
        return manger;
    };
}

-(MZKit *(^)(id, int))addTo
{
    return ^(id supObj,int tag){
    
        if ([supObj respondsToSelector:@selector(addSubview:)]) {
            [supObj performSelector:@selector(addSubview:) withObject:self.someObj];
            if ([self.someObj respondsToSelector:@selector(setTag:)]) {
                IMP imp = [self.someObj methodForSelector:@selector(setTag:)];
                void(*func)(id,SEL,int) = (void *)imp;
                func(self.someObj,@selector(setTag:),tag);
            }else
            {
                MZLog(@"not support setTag");
            }
        }else
        {
            MZLog(@"not support addSubView");
        }
        return self;
    };
}


+ (MZKit * (^)(id,int))configWithTag
{
    return ^(id supObj,int tag){
       __block MZKit * weakManger = manger;
        SEL sel = @selector(viewWithTag:);
        if ([supObj respondsToSelector:sel]) {
            IMP imp = [supObj methodForSelector:sel];
            id(*func)(id,SEL,int) = (void *)imp;
            weakManger.someObj = func(supObj,sel,tag);
        }
        return manger;
    };
}

+ (id (^)(id,int))objFromTag
{
    return ^(id supObj,int tag){
        __block id targetObj;
            
    
        SEL sel = @selector(viewWithTag:);
        if ([supObj respondsToSelector:sel]) {
            IMP imp = [supObj methodForSelector:sel];
            id(*func)(id,SEL,int) = (void *)imp;
            targetObj = func(supObj,sel,tag);
        }
        return targetObj;
    };
}

+ (id (^)(id, ...))configBlock
{
    return ^(id obj,...){
        va_list args;
        va_start(args, obj);
        if (obj) {
            id other;
            NSLog(@"%@",NSStringFromClass([obj class]));
            while ((other = va_arg(args, id))) {
                NSLog(@"%@",NSStringFromClass([other class]));
            }
        }
        va_end(args);
        
        return manger;
    };
}


- (id(^)())end
{
    return ^{
        return self.someObj;
    };
}

@end
