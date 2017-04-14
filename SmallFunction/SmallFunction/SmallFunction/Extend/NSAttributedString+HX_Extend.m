//
//  NSAttributedString+HX_Extend.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "NSAttributedString+HX_Extend.h"
#import "HXAttributedMode.h"
#import "UIColor+HX_Extend.h"

@implementation NSAttributedString (HX_Extend)

+(NSAttributedString *)HXAttributedStringWithString:(NSString *)string font:(UIFont *)font{
    return [NSAttributedString HXAttributedStringWithString:string leftTabString:@"<:#" rightTabString:@"#:>" font:font];
}

+(NSAttributedString *)HXAttributedStringWithString:(NSString *)string leftTabString:(NSString *)leftTab rightTabString:(NSString *)rightTab font:(UIFont *)font{
    NSArray *stringArray = [string componentsSeparatedByString:leftTab];
    NSMutableString *mString = [[NSMutableString alloc] init];
    NSMutableArray *colorArray = [[NSMutableArray alloc] init];
    int index = 0;
    for (int i = 0; i < stringArray.count; i++) {
        NSString *nString = stringArray[i];
        NSArray *nSArray = [nString componentsSeparatedByString:rightTab];
        if (nString.length > 0 && nSArray.count > 0) {
            HXAttributedMode *model = [[HXAttributedMode alloc] init];
            if (nSArray.count > 1) {
                model.index = index;
                model.colorStringLength = ((NSString *)nSArray[1]).length;
                model.HexColorString = nSArray[0];
                [mString appendString:nSArray[1]];
                index += ((NSString *)nSArray[1]).length;
            }else{
                model.index = index;
                model.colorStringLength = nString.length;
                model.HexColorString = DefaultAttributedColorString;
                [mString appendString:nString];
                index += ((NSString *)nSArray[0]).length;
            }
            if (model.colorStringLength > 0) {
                [colorArray addObject:model];
            }
        }
        
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:mString];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
    for (int i = 0; i < colorArray.count; i++) {
        HXAttributedMode *colorModel = colorArray[i];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:colorModel.HexColorString] range:NSMakeRange(colorModel.index, colorModel.colorStringLength)];
    }
    return attributedString;
}

@end
