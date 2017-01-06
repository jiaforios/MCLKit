//
//  MZUIKit.h
//  MCLKit
//
//  Created by foscam on 17/1/6.
//  Copyright © 2017年 zengjia. All rights reserved.
//

#import "MZView.h"
#import "MZDefine.h"

@interface MZUIKit : MZView

+(MZView *)configDataBlock:(NSDictionary *(^)())configBlock;

@end
