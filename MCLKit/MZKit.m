//
//  MZKit.m
//  MCLKit
//
//  Created by foscom on 16/12/2.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MZKit.h"
#import <objc/runtime.h>
static char objectkey;
static char objectkeytype;

static MZKit *mzManger = nil;
@implementation MZKit

+ (MZKit *(^)(NSString*))mzKit
{
    mzManger = [MZKit new];
    return ^(NSString *type){
    
        if ([type isEqualToString:@"label"]) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
            objc_setAssociatedObject(mzManger, &objectkey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(mzManger, &objectkeytype, type, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return mzManger;
    };
}

- (MZKit *(^)(NSString*))text
{
    return ^(NSString *text){
        NSString *type = objc_getAssociatedObject(mzManger, &objectkeytype);
        UILabel *label  = objc_getAssociatedObject(mzManger, &objectkey);
        label.text = text;
        return mzManger;
    };
}


- (MZKit *(^)(UIColor *))textColor
{
    return ^(UIColor *color){
    
        NSString *type = objc_getAssociatedObject(mzManger, &objectkeytype);
        UILabel *label  = objc_getAssociatedObject(mzManger, &objectkey);
        label.textColor = color;
        
        return mzManger;
    };
}

- (id(^)())end
{
    return ^{
        return objc_getAssociatedObject(mzManger, &objectkey);
    };
}

@end
