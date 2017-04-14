//
//  UIColor+HX_Extend.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (HX_Extend)

/*
    *从十六进制字符串获取颜色
    -color      支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

//
/*
    *从十六进制字符串获取颜色设置透明度
    -color      支持@“#123456”、 @“0X123456”、 @“123456”三种格式
    -alpha      透明值
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
