//
//  HXAttributedMode.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <Foundation/Foundation.h>

/*       字体默认黑色       */
#define DefaultAttributedColorString    @"000000"

@interface HXAttributedMode : NSObject

/*
    *HXAttributedMode属性
    -HexColorString     字符串色值
    -index              在父串中的坐标
    -colorStringLength  字符串长度
    -fontSize           字号大小
 */
@property (nonatomic, copy)     NSString    *HexColorString;
@property (nonatomic, assign)   NSUInteger  index;
@property (nonatomic, assign)   NSUInteger  colorStringLength;
@property (nonatomic, assign)   NSUInteger  fontSize;

@end
