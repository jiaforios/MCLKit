//
//  ViewController.m
//  MCLKit
//
//  Created by foscom on 16/12/2.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "MZKit.h"
#import "MZKit+Config.h"
#import "MZUIKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     MZKit.initCls([UILabel class]).m_Frame(CGRectMake(10, 100, 100, 100)).m_Text(@"xiaoming").m_TextColor([UIColor redColor]).addTo(self.view,10).m_Tartget(self,@selector(makeTest:),UIControlEventTouchUpInside).end();
    
     MZKit.configWithTag(self.view,10).m_BackgroundColor([UIColor blueColor]).end();
    
    */
    
//    configdata(...) = @{@"text_color":@"",@"background_color":@""};
    
    
    
//    button.configData = configdata;
    
    
//    MZKit.configBlock(t_color(redColor),@"textstr",bg_color(blueColor),nil);
    
//  UIButton *btn =  [buton configclok:(NSDictionary *dic){
//    
//      dic = @{Alloc:[UIButton alloc],
//              tc: [UIColor redcolor],
//             bgc: [UIColor redcolor]
//            };
//  }];
    
    
//    UILabel *label;
//    label.textAlignment
        

    
     [MZUIKit configDataBlock:^NSDictionary *{
        
        return  @{ALLOC:CLASS(UILabel),
                  BGC:[UIColor redColor],
                  TC:[UIColor blueColor],
                  TXT:@"测试数据",
                  TAMT:NUM(NSTextAlignmentLeft),
                  FT:[UIFont systemFontOfSize:30],
                  SUPERVIEW:self.view};
         

         
//         return TEMPLATE_LABEL(redColor, blueColor, @"测试",NSTextAlignmentLeft, 30);
         
         
         
    }];

    
}



- (void)makeTest:(UIButton *)sender
{
    NSLog(@"点击事件");
    MZKit.configWithTag(self.view,10).m_BackgroundColor([UIColor redColor]).end();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end








