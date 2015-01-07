//
//  ViewController.m
//  pixView
//
//  Created by shadow on 2015/1/7.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "ViewController.h"


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
        ChooseFractionView *chooseFractionView = [[ChooseFractionView alloc]init:CGRectMake(startX , startY , [UIScreen mainScreen].bounds.size.width , 35.0)titleString:titleString fractionNumber:5];
        chooseFractionView.tag = i;
        chooseFractionView.delegate = self;
        startY += hMargin;
        [self.view addSubview:chooseFractionView];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chooseFractionView:(ChooseFractionView *)chooseFractionView fraction:(int)fraction
{
    NSLog(@"Tag:%i",(int)chooseFractionView.tag);
    NSLog(@"fraction:%i",fraction);
}

@end
