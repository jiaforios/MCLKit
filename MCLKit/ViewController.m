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
    
    MZKit.configBlock(t_color(redColor),@"textstr",nil);
    
    

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








