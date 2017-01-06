//
//  MZDefine.h
//  MCLKit
//
//  Created by foscam on 17/1/6.
//  Copyright © 2017年 zengjia. All rights reserved.
//

#ifndef MZDefine_h
#define MZDefine_h

/* TC 设置字体色*/

#define TC      @"setTextColor:"
/* BGC 设置背景色*/

#define BGC     @"setBackgroundColor:"

/* TAMT 对齐方式*/

#define TAMT   @"setTextAlignment:"
/* text*/

#define TXT    @"setText:"

/* 字体*/
#define FT    @"setFont:"

/* ALLOC 初始化类*/

#define ALLOC   @"alloc"

#define CLASS(KIT) [[KIT alloc] init]

/* NUM() 基本数据类型转NSNumber 处理*/

#define NUM(num) @(num)


#define SUPERVIEW @"superview"


/* 模板 R-BG-T-AL-Ft */

#define TEMPLATE_LABEL(R,BG,T,AL,Ft) @{ALLOC:CLASS(UILabel),\
                    BGC:[UIColor R],\
                    TC:[UIColor BG],\
                    TXT:T,\
                    TAMT:NUM(AL),\
                    FT:[UIFont systemFontOfSize:Ft],\
                    SUPERVIEW:self.view}


#endif /* MZDefine_h */
