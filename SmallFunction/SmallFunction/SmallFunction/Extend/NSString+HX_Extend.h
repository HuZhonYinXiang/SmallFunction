//
//  NSString+HX_Extend.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HX_Extend)

/*
    *计算Helvetica Neue字号的高度
    -size       字符串的最大范围
    -fontSize   字号大小
 */
- (CGRect)computeHelveticaNeueStringHeightWithCGSize:(CGSize)size fontSize:(CGFloat)fontSize;

/*
    *计算System字号高度
    -size       字符串的最大范围
    -fontSize   字号大小
 */
- (CGRect)computeSystemStringHeightWithCGSize:(CGSize)size fontSize:(CGFloat)fontSize;

/*
    *计算字体的高度
    -size       字符串的最大范围
    -fontSize   字符串的font
 */
- (CGRect)computeStringHeightWithCGSize:(CGSize)size Font:(UIFont *)font;

/*
    *判断字符串自身是否是int类型
 */
- (BOOL)isPurelnt;

@end
