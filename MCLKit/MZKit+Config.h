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
- (MZKit *(^)(CGRect))m_Frame;
- (MZKit *(^)(NSString*))m_Text;
- (MZKit *(^)(UIColor *))m_TextColor;
- (MZKit *(^)(UIColor *))m_BackgroundColor;


@end
