//
//  HXCustomLabel.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "HXCustomLabel.h"
#import "UILabel+HX_Extend.h"

@implementation HXCustomLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)NewHXCustomLabelWithFrame:(CGRect)nFrame title:(NSString *)title textColor:(UIColor *)textColor size:(UIFont *)font alignment:(NSTextAlignment)alignment{
    HXCustomLabel *label = [[HXCustomLabel alloc] initWithFrame:nFrame];
    label.text = title;
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    label.textAlignment = alignment;
    return label;
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
/*          HXLFLabel           */
@interface HXLFLabel()

@end

@implementation HXLFLabel

+(instancetype)NewLFLabelWithFrame:(CGRect)nFrame title:(NSString *)title textColor:(UIColor *)textColor size:(UIFont *)font alignment:(NSTextAlignment)alignment{
    HXLFLabel *lfLabel = [HXLFLabel NewHXCustomLabelWithFrame:nFrame title:title textColor:textColor size:font alignment:alignment];
    return lfLabel;
}

- (void)setText:(NSString *)text{
    [super setText:text];
    CGFloat width = self.frame.size.width;
    [self changeAlignmentLeftAndRightWithTextWidth:width];
}

@end
