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
    
    UILabel *label  = MZKit.initCls([UILabel class]).m_Frame(CGRectMake(10, 100, 100, 100)).m_Text(@"xiaoming").m_TextColor([UIColor redColor]).addTo(self.view,10).end();

//    UILabel *lbel = MZKit.fromTag(self.view,10);
    
//    NSLog(@"tag = %d",lbel.tag);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end








