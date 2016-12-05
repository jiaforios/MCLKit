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
//            [self.someObj setValue:[NSValue valueWithCGRect:frame] forKey:funcstr];
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

- (SEL)creatSetterWithPropertyName:(NSString *) propertyName{
//    propertyName = propertyName.capitalizedString;
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
    return NSSelectorFromString(propertyName);
}




@end
