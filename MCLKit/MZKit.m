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

+ (MZKit*(^)())initMz
{
//    mzManger = [MZKit new];

    return ^(){
        return [MZKit new];
    };
}


- (MZKit *(^)())Label
{
    return ^(){
        UILabel *label = [[UILabel alloc] init];
        self.someObj = label;
        return self;
    };
}

-(MZKit *(^)())Button
{
    return ^(){
        UIButton *label = [[UIButton alloc] init];
        return self;
    };

}


-(MZKit *(^)())ImageView
{
    return ^(){
        UIImageView *label = [[UIImageView alloc] init];
        return self;
    };

}

-(MZKit *(^)())TextField
{
    return ^(){
        UITextField *label = [[UITextField alloc] init];
//        objc_setAssociatedObject(self, &objectkey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

-(MZKit *(^)())Segment
{
    return ^(){
        UISegmentedControl *label = [[UISegmentedControl alloc] init];
//        objc_setAssociatedObject(mzManger, &objectkey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}



- (id(^)())end
{
    return ^{
        return self.someObj;
    };
}

@end
