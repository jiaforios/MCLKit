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

- (MZKit *(^)(CGRect))m_frame
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

- (void)funcStr:(NSString *)str andObj:(id)obj resultBlock:(void(^)(SEL))resBlock
{
    while ([[obj class] isSubclassOfClass:[NSObject class]]) {
        unsigned int count = 0;
        objc_property_t *propertys = class_copyPropertyList([self.someObj class], &count);
        for (int i = 0; i<count; i++) {
            objc_property_t property = propertys[i];
            const char *name = property_getName(property);
            NSString *ocName = [NSString stringWithUTF8String:name];
            if ([str containsString:ocName]) {
                SEL sel =  [self creatSetterWithPropertyName:ocName];
                
                if ([self.someObj respondsToSelector:sel]) {
                    resBlock?resBlock(sel):nil;
                    free(propertys);
                    return;
                }else
                {
                    resBlock?resBlock(nil):nil;
                }
            }
            
        }
        obj = [obj superclass];
    }
}
- (MZKit *(^)(NSString*))m_text
{
    return ^(NSString *text){
        NSString *funcStr = [NSString stringWithUTF8String:sel_getName(_cmd)];
        [self funcStr:funcStr andObj:self.someObj resultBlock:^(SEL sel) {
            IMP imp = [self.someObj methodForSelector:sel];
            void (*func)(id, SEL, NSString *) = (void *)imp;
            func(self.someObj, sel, text);
            
        }];
        return self;
    };
}

- (SEL)creatSetterWithPropertyName:(NSString *) propertyName{
    propertyName = propertyName.capitalizedString;
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
    return NSSelectorFromString(propertyName);
}

- (MZKit *(^)(UIColor *))m_textColor
{
    return ^(UIColor *color){
        return self;
    };
}

-(MZKit *(^)(UIColor *))m_backgroundColor
{
    return ^(UIColor *color){
        
        return self;
    };
}


@end
