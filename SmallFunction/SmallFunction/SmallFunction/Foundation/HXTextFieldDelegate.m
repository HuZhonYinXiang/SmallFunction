//
//  HXTextFieldDelegate.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "HXTextFieldDelegate.h"

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
@implementation HXTextFieldDelegate

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
@interface HXPhoneTextFieldDelegate()<UITextFieldDelegate>

//判断Block是否调用
@property (nonatomic, assign) BOOL isMax;

@end

@implementation HXPhoneTextFieldDelegate

+(instancetype)NewPhoneTextFieldDelegate{
    HXPhoneTextFieldDelegate *phoneDelegate = [[HXPhoneTextFieldDelegate alloc] init];
    return phoneDelegate;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length > 10 && string.length > 0) {
        //超过11位，禁止输入
        return false;
    }
    //判断字符串是否达到11位
    if (textField.text.length == 10 && string.length > 0 && self.isMax == false) {
        self.isMax = true;
        if (self.fullphonenumberBlock) {
            self.fullphonenumberBlock(true,textField);
        }
    }else if(self.isMax == true){
        self.isMax = false;
        if (self.fullphonenumberBlock) {
            self.fullphonenumberBlock(false,textField);
        }
    }
    return true;
}

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
@interface HXPasswordTextFieldDelegate()<UITextFieldDelegate>

/*
    密码最低位数限制    default 0
    isMin 判断Block是否已调用
 */
@property (nonatomic, assign) NSInteger minPassNum;
@property (nonatomic, assign) BOOL isMin;
/*
    密码最高位数限制    default 16
 */
@property (nonatomic, assign) NSInteger maxPassNum;

/*
    是否达到最低位数Block
 */
@property (nonatomic, strong) TextFieldTextLengthBlock minPasswordBlock;

@end

@implementation HXPasswordTextFieldDelegate

+(instancetype)NewPasswordTextFieldDelegateWithPassNum:(NSInteger)maxPassNum{
    HXPasswordTextFieldDelegate *passwordDelegate = [[HXPasswordTextFieldDelegate alloc] init];
    passwordDelegate.maxPassNum = (maxPassNum > 0)? maxPassNum:16;
    return passwordDelegate;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length > self.maxPassNum && string.length > 0) {
        //超过密码限制数，禁止输入
        return false;
    }
    if (self.minPasswordBlock && self.minPassNum > 0) {
        if (((textField.text.length >= self.minPassNum) || (textField.text.length == self.minPassNum - 1 && string.length > 0)) && self.isMin == false) {
            self.isMin = true;
            self.minPasswordBlock(true,textField);
        }else if(self.isMin == true){
            self.isMin = false;
            self.minPasswordBlock(false,textField);
        }
    }
    return true;
}

- (void)setPasswordMinNum:(NSInteger)minPassNum minPassBlock:(TextFieldTextLengthBlock)minBlock{        self.minPassNum = minPassNum;
    
}

@end

