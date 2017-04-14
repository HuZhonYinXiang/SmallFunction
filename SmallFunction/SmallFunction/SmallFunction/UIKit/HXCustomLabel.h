//
//  HXCustomLabel.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXCustomLabel : UILabel

+(instancetype)NewHXCustomLabelWithFrame:(CGRect)nFrame title:(NSString *)title textColor:(UIColor *)textColor size:(UIFont *)font alignment:(NSTextAlignment)alignment;

@end

/*                 */
/**/
/***/
/****/
/*****/
/******/
/*******/
/********/
/*********/
/**********/
/*********/
/********/
/*******/
/******/
/*****/
/****/
/***/
/**/
/*          HXLFLabel           */
@interface HXLFLabel : HXCustomLabel

+(instancetype)NewLFLabelWithFrame:(CGRect)nFrame title:(NSString *)title textColor:(UIColor *)textColor size:(UIFont *)font alignment:(NSTextAlignment)alignment;

@end
