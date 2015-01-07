//
//  ChooseFractionView.m
//  pixView
//
//  Created by shadow on 2015/1/7.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#define blueColor [UIColor colorWithRed:0.0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]

#import "ChooseFractionView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChooseFractionView
{
    NSMutableArray *fractionViews;
    NSMutableArray *fractionLabels;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (id)init:(CGRect)rect titleString:(NSString *)string fractionNumber:(NSInteger)number
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(rect.origin.x , rect.origin.y , rect.size.width , rect.size.height);
        fractionViews = [[NSMutableArray alloc]init];
        fractionLabels = [[NSMutableArray alloc]init];
        [self buildTitleLabel:string];
        [self buildChooseFractionView:number];
    // Drawing code
    }
    return self;
}

-(void)buildTitleLabel:(NSString *)string
{
    UILabel *label = [[UILabel alloc]init];
    [label setFrame:CGRectMake(20.0 , 0.0 , 80.0 , 25.0)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldSystemFontOfSize:17.0]];
    [label setText:string];
    [self addSubview:label];
}

-(void)buildChooseFractionView:(NSInteger)number
{
    int count = (int)number;
    
    CGFloat startX = 100.0;
    for (int i = 0 ; i < count ; i++)
    {
        UIView *view = [[UIView alloc]init];
        [view setFrame:CGRectMake(startX , -3.0 , 40.0 , 30.0)];
        [view setBackgroundColor:[UIColor whiteColor]];
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseFractionAction:)];
        [view addGestureRecognizer:singleFingerTap];
        [view setTag:i];
        [view.layer setBorderWidth:0.5];
        [view.layer setBorderColor:[blueColor CGColor]];
        [fractionViews addObject:view];
        [self addSubview:view];
        
        CGSize labelSize = CGSizeMake(10.0 , 20.0);
        UILabel *label = [[UILabel alloc]init];
        [label setFrame:CGRectMake((view.frame.size.width - labelSize.width) / 2  , (view.frame.size.height - labelSize.height) / 2 , labelSize.width , labelSize.height)];
        [label setFont:[UIFont boldSystemFontOfSize:15.0]];
        [label setTextColor:blueColor];
        [label setText:[NSString stringWithFormat:@"%i",(i + 1)]];
        [fractionLabels addObject:label];
        [view addSubview:label];
        
        startX += 39.0;
        
        if (i == 0)
        {
            UIBezierPath *leftMaskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(3.0, 3.0)];
            CAShapeLayer *leftMaskLayer = [[CAShapeLayer alloc] init];
            leftMaskLayer.frame = view.bounds;
            leftMaskLayer.path = leftMaskPath.CGPath;
            [view.layer setMask:leftMaskLayer];
            [view setBackgroundColor:blueColor];
            [label setTextColor:[UIColor whiteColor]];
        }
        if (i == (count - 1))
        {
            UIBezierPath *rightMaskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(3.0, 3.0)];
            CAShapeLayer *rightMaskLayer = [[CAShapeLayer alloc] init];
            rightMaskLayer.frame = view.bounds;
            rightMaskLayer.path = rightMaskPath.CGPath;
            [view.layer setMask:rightMaskLayer];
        }
    }
}

-(void)chooseFractionAction:(UITapGestureRecognizer *)recognizer
{
    int touchIndex = (int)recognizer.view.tag;
//    NSLog(@"touchIndex:%i",touchIndex);
    
    for (int i = 0 ; i < [fractionViews count] ; i++)
    {
        UIView *view = (UIView *)[fractionViews objectAtIndex:i];
        if (touchIndex >= i)
        {
            [view setBackgroundColor:blueColor];
        }else
        {
            [view setBackgroundColor:[UIColor whiteColor]];
        }
    }
    for (int i = 0 ; i < [fractionLabels count] ; i++)
    {
        UILabel *label = (UILabel *)[fractionLabels objectAtIndex:i];
        if (touchIndex >= i)
        {
            [label setTextColor:[UIColor whiteColor]];
        }else
        {
            [label setTextColor:blueColor];
        }
    }
}

@end
