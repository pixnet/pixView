//
//  ViewController.m
//  pixView
//
//  Created by shadow on 2015/1/7.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "ViewController.h"
#import "ChooseFractionView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"環境",@"服務品質",@"美味",@"CP值", nil];
    
    CGFloat startX = 0.0;
    CGFloat startY = 60.0;
    CGFloat hMargin = 50.0;
    for (int i = 0 ; i < [array count] ; i++)
    {
        NSString *titleString = [array objectAtIndex:i];
        ChooseFractionView *view = [[ChooseFractionView alloc]init:CGRectMake(startX , startY , [UIScreen mainScreen].bounds.size.width , 35.0)titleString:titleString fractionNumber:5];
        startY += hMargin;
        [self.view addSubview:view];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
