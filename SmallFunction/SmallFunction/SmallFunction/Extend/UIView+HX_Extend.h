//
//  UIView+HX_Extend.h
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HX_Extend)

/*
    *显示无数据图片，设置图片纵坐标
    -yOffset        横向中间对齐，设置纵向坐标位置
 */
- (void)showNoDataViewWithyOffset:(CGFloat)yOffset;

/*
    *显示无数据图片，默认图片在View中央
 */
- (void)showNoDataView;

/*
    *显示数据错误图片
 */
- (void)showErrorDataView;

/*
    *隐藏无数据图片
 */
- (void)hideNoDataView;

@end
