//
//  ViewController.m
//  MarQuee
//
//  Created by 1860 on 2017/5/8.
//  Copyright © 2017年 HangZhao. All rights reserved.
//

#import "ViewController.h"
#import "MarQuee.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor brownColor]];
    MarQuee *marQuee = [[MarQuee alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40) withTitle:@"苏清波放假不回家的步伐几点上班火炬大厦不放假备受打击还看电视交换空间啊"];
    [self.view addSubview:marQuee];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
