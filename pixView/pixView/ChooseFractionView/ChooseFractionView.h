//
//  ChooseFractionView.h
//  pixView
//
//  Created by shadow on 2015/1/7.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseFractionView : UIView

/**
 *  建立選擇分數的View
 *
 *  @param rect   View的大小
 *  @param string 分數標題
 *  @param number 分數數量
 *
 *  @return 回傳分數的View
 */
- (id)init:(CGRect)rect titleString:(NSString *)string fractionNumber:(NSInteger)number;


@end
