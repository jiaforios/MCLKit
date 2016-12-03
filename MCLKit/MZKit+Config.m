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
        if ([self.someObj isKindOfClass:[UIView class]]) {
            
            UIView *view = (UIView *)self.someObj;
            view.frame = frame;
        }
        return self;
    };
}

- (void)funcStr:(NSString *)str andObj:(id)obj resultBlock:(void(^)(SEL))resBlock
{
    while ([[obj class] isSubclassOfClass:[NSObject class]]) {
        NSLog(@"class = %@",NSStringFromClass([obj class]));
        unsigned int count = 0;
        objc_property_t *propertys = class_copyPropertyList([self.someObj class], &count);
        for (int i = 0; i<count; i++) {
            objc_property_t property = propertys[i];
            const char *name = property_getName(property);
            NSString *ocName = [NSString stringWithUTF8String:name];
            NSLog(@"ocname = %@",ocName);
            if ([str containsString:ocName]) {
                SEL sel =  [self creatSetterWithPropertyName:ocName];
                if ([self.someObj respondsToSelector:sel]) {
                    NSLog(@"响应方法");
                    resBlock?resBlock(sel):nil;
                    free(propertys);
                    return;
                }else
                {
                    NSLog(@"不响应方法");
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
            [self.someObj performSelector:sel withObject:text];
        }];
        return self;
    };
}



- (SEL) creatSetterWithPropertyName:(NSString *) propertyName{
    
    //1.首字母大写
    propertyName = propertyName.capitalizedString;
    
    //2.拼接上set关键字
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
    
    //3.返回set方法
    return NSSelectorFromString(propertyName);
}

- (MZKit *(^)(UIColor *))m_textColor
{
    return ^(UIColor *color){
        
//        NSString *type = objc_getAssociatedObject(self, &objectkeytype);
//        UILabel *label  = objc_getAssociatedObject(self, &objectkey);
//        label.textColor = color;
        
        return self;
    };
}

-(MZKit *(^)(UIColor *))m_backgroundColor
{
    return ^(UIColor *color){
        
        //        NSString *type = objc_getAssociatedObject(self, &objectkeytype);
//        UILabel *label  = objc_getAssociatedObject(self, &objectkey);
//        label.backgroundColor = color;
        
        return self;
    };
}


@end
