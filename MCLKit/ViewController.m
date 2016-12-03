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
    
    
//    UILabel *label =  MZKit.initMz().Label().m_frame(CGRectMake(10, 100, 100, 100)).end();
    
    UILabel *label =  MZKit.initMz().Label().m_frame(CGRectMake(10, 100, 100, 100)).m_text(@"xiaoming").end();

    
//    label.backgroundColor = [UIColor redColor];
    
    
    
    
    [self.view addSubview:label];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
