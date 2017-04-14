//
//  UIScrollView+HX_Extend.m
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "UIScrollView+HX_Extend.h"

@implementation UIScrollView (HX_Extend)

+(instancetype)NewImageViewWithFrame:(CGRect)nFrame delegate:(id)delegate contentSize:(CGSize)contentSize subViews:(NSArray *)subViews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:nFrame];
    scrollView.delegate = delegate;
    scrollView.showsVerticalScrollIndicator = false;
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.pagingEnabled = true;
    scrollView.contentSize = contentSize;
    if (subViews) {
        for (id subView in subViews) {
            [scrollView addSubview:subView];
        }
    }
    return scrollView;
}

@end
