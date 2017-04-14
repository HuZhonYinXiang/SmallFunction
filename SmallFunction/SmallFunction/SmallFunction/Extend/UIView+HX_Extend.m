//
//  UIView+HX_Extend.m
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "UIView+HX_Extend.h"

@implementation UIView (HX_Extend)

- (void)showNoDataViewImage:(NSString *)image yOffset:(CGFloat)yOffset{
    UIImageView *imgView = [self viewWithTag:997];
    if (imgView) {return;}
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 146)];
    imgView.center = CGPointMake(self.frame.size.width*0.5, (self.frame.size.height*0.5)+yOffset);
    imgView.image = [UIImage imageNamed:image];
    imgView.tag = 997;
    [self addSubview:imgView];
}
- (void)showNoDataViewWithyOffset:(CGFloat)yOffset{
    [self showNoDataViewImage:@"ZXNoDataImage@2x.png" yOffset:yOffset];
}
- (void)showNoDataView{
    [self showNoDataViewImage:@"ZXNoDataImage@2x.png" yOffset:0];
}
- (void)showErrorDataView{
    [self showNoDataViewImage:@"ZXNoDataImage@2x.png" yOffset:0];
}
- (void)hideNoDataView{
    UIImageView *imgView = [self viewWithTag:997];
    [imgView removeFromSuperview];
}

@end
