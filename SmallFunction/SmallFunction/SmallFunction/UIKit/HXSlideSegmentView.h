//
//  HXSlideSegmentView.h
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXSlideSegmentView : UIView

/*       segment滑动点击进行回调       */
@property (nonatomic, strong) void(^SelectTitleIndexBlock)(int index);

/*
    *初始化一个滑动title
    -tArray         title数组
    -showCount      页面显示出几个title
    -index          初始显示的title
    -nFrame         view的坐标
 */
+(instancetype)NewSlideSegmentViewWithTitleArray:(NSArray *)tArray showCount:(int)showCount selectIndex:(int)index frame:(CGRect)nFrame;

@end
