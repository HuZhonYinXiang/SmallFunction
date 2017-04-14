//
//  NSString+HX_Extend.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "NSString+HX_Extend.h"

@implementation NSString (HX_Extend)

- (CGRect)computeHelveticaNeueStringHeightWithCGSize:(CGSize)size fontSize:(CGFloat)fontSize{
    return [self computeStringHeightWithCGSize:size Font:[UIFont fontWithName:@"Helvetica Neue" size:fontSize]];
}

- (CGRect)computeSystemStringHeightWithCGSize:(CGSize)size fontSize:(CGFloat)fontSize{
    return [self computeStringHeightWithCGSize:size Font:[UIFont systemFontOfSize:fontSize]];
}

- (CGRect)computeStringHeightWithCGSize:(CGSize)size Font:(UIFont *)font{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *sizeDic = @{NSFontAttributeName:font,
                              NSParagraphStyleAttributeName:style};
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                  attributes:sizeDic
                                     context:nil];
    
    return rect;
}



- (BOOL)isPurelnt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

@end
