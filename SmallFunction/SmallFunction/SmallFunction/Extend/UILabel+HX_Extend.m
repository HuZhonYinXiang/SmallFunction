//
//  UILabel+HX_Extend.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "UILabel+HX_Extend.h"

@implementation UILabel (HX_Extend)

- (void)changeAlignmentLeftAndRightWithTextWidth:(CGFloat)width{
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil].size;
    if (width == 0) {
        width = self.frame.size.width;
    }
    CGFloat margin = (width - textSize.width)/(self.text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributedString;
}

@end
