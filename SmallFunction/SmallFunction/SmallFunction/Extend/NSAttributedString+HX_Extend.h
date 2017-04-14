//
//  NSAttributedString+HX_Extend.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (HX_Extend)

/*
 *根据<:#与#:>修改富文本信息
 -string         富文本字符串
 -font           字体
 */
+(NSAttributedString *)HXAttributedStringWithString:(NSString *)string font:(UIFont *)font;


/*
 *根据特殊标签修改字符串的富文本信息，具体与后台商定
 -string         富文本字符串
 -leftTab        用来切割字符串各个不同的富文本
 -rightTab       获取富文本内的参数
 -----<:#色值#:>第一段富文本字符串<:#色值#:>第二段富文本字符串
 -font           字体
 */
+(NSAttributedString *)HXAttributedStringWithString:(NSString *)string leftTabString:(NSString *)leftTab rightTabString:(NSString *)rightTab font:(UIFont *)font;

@end
