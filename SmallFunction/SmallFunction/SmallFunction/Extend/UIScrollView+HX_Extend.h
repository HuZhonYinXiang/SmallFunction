//
//  UIScrollView+HX_Extend.h
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HX_Extend)

/*
    *初始化一个ScrollView
    -nFrame         scrollView的坐标
    -delegate       scrollView代理执行者
    -contentSize    scrollView的内容坐标
    -subViews       scrollView中add的子页面
 */
+(instancetype)NewImageViewWithFrame:(CGRect)nFrame delegate:(id)delegate contentSize:(CGSize)contentSize subViews:(NSArray *)subViews;

@end
