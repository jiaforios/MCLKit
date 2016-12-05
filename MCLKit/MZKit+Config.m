//
//  MZKit+Config.m
//  MCLKit
//
//  Created by foscom on 16/12/3.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MZKit+Config.h"
#import <objc/runtime.h>

@implementation MZKit (Config)

- (MZKit *(^)(CGRect))m_Frame
{

    return ^(CGRect frame){
        NSString *funcstr = [NSString stringWithUTF8String:sel_getName(_cmd)];
        funcstr = [funcstr substringFromIndex:[funcstr rangeOfString:@"m_"].length];
        SEL sel = [self creatSetterWithPropertyName:funcstr];
        if ([self.someObj respondsToSelector:sel]) {
            IMP imp = [self.someObj methodForSelector:sel];
            void (*func)(id, SEL, CGRect ) = (void *)imp;
            func(self.someObj, sel, frame);
            
        }
        
        return self;
    };
}

- (MZKit *(^)(NSString*))m_Text
{
    return ^(NSString *text){
        
            self.selAction(sel_getName(_cmd),text);        
        return self;
    };
}



- (MZKit *(^)(const char *,id))selAction
{
    return ^(const char *cmd,id obj){
        NSString *funcstr = [NSString stringWithUTF8String:cmd];
             funcstr = [funcstr substringFromIndex:[funcstr rangeOfString:@"m_"].length];
        SEL sel = [self creatSetterWithPropertyName:funcstr];
        if ([self.someObj respondsToSelector:sel]) {
            IMP imp = [self.someObj methodForSelector:sel];
            void (*func)(id, SEL, id ) = (void *)imp;
            func(self.someObj, sel, obj);
        }else
        {
            NSLog(@" 不支持的方法%@",funcstr);
        }
        return self;
    };
}

- (MZKit *(^)(UIColor *))m_TextColor
{
    return ^(UIColor *color){
        self.selAction(sel_getName(_cmd),color);
        return self;
    };
}

-(MZKit *(^)(UIColor *))m_BackgroundColor
{
    return ^(UIColor *color){
        self.selAction(sel_getName(_cmd),color);
        return self;
    };
}


- (MZKit *(^)(id,SEL,UIControlEvents))m_Tartget
{
    return ^(id obj,SEL sel,UIControlEvents event){
    
        SEL sel0 = @selector(addTarget:action:forControlEvents:);
        
        if ([self.someObj respondsToSelector:sel0])
        {
            IMP imp = [self.someObj methodForSelector:sel0];
            
            void (*func)(id, SEL, id,SEL,UIControlEvents) = (void *)imp;
            func(self.someObj, sel0,obj,sel,event);
            
        }
        return self;
    };
}


- (SEL)creatSetterWithPropertyName:(NSString *) propertyName{
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
    return NSSelectorFromString(propertyName);
}




@end
