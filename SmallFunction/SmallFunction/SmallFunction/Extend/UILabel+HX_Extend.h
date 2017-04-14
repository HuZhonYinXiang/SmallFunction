//
//  UILabel+HX_Extend.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>
/********     需要添加CoreText库     ********/
#import <CoreText/CoreText.h>

@interface UILabel (HX_Extend)

/*
    *将label的text左右对齐
    -width      label的高度
 */
- (void)changeAlignmentLeftAndRightWithTextWidth:(CGFloat)width;

@end
