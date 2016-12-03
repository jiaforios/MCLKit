//
//  MZKit.h
//  MCLKit
//
//  Created by foscom on 16/12/2.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>


@interface MZKit : NSObject
@property(nonatomic,strong)id someObj;

+ (MZKit*(^)())initMz;
- (MZKit *(^)())Label;
- (MZKit *(^)())Button;
- (MZKit *(^)())ImageView;
- (MZKit *(^)())TextField;
- (MZKit *(^)())Segment;

- (id(^)())end;

@end
