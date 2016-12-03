//
//  MZKit+Config.h
//  MCLKit
//
//  Created by foscom on 16/12/3.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MZKit.h"

#define MZ(a) MZKit *(^)(a)

@interface MZKit (Config)
- (MZKit *(^)(CGRect))m_frame;
- (MZKit *(^)(NSString*))m_text;
- (MZKit *(^)(UIColor *))m_textColor;
- (MZKit *(^)(UIColor *))m_backgroundColor;


@end
