//
//  HXTextFieldDelegate.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*-----------                */
/*
 *判断text的length是否达到规定数的Block
 -isFull     true  or  false
 -textField  输入框对象
 */
typedef void(^TextFieldTextLengthBlock)(BOOL isFull, UITextField *textField);

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
@interface HXTextFieldDelegate : NSObject

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
/*          手机输入框代理           */
@interface HXPhoneTextFieldDelegate : NSObject

/*   手机号是否达到11位Block   */
@property (nonatomic, strong) TextFieldTextLengthBlock fullphonenumberBlock;

/*
    *初始化方法
 */
+(instancetype)NewPhoneTextFieldDelegate;

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
/*          密码输入框代理           */
@interface HXPasswordTextFieldDelegate : NSObject

/*
    *初始化方法
    -maxPassNum     传0使用默认      default 16
 */
+(instancetype)NewPasswordTextFieldDelegateWithPassNum:(NSInteger)maxPassNum;

/*
    *设置最低密码位数   不调用默认0
    -minPassNum     最低的密码位数     default 0
    -minBlock       是否达到位数block
 */
- (void)setPasswordMinNum:(NSInteger)minPassNum minPassBlock:(TextFieldTextLengthBlock)minBlock;


@end
