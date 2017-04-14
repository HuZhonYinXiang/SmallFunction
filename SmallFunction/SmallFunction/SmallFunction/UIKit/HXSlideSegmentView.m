//
//  HXSlideSegmentView.m
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/14.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "HXSlideSegmentView.h"
#import "UIColor+HX_Extend.h"

@interface HXSlideSegmentView()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    int _selectIndex;
    int _surplusCount;
    int _showCount;
    int _page;
    int _nowLabelIndex;
    UIView *_bkgView;
    UIView *_recognizerView;
    NSMutableArray *_titleArray;
}

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation HXSlideSegmentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)NewSlideSegmentViewWithTitleArray:(NSArray *)tArray showCount:(int)showCount selectIndex:(int)index frame:(CGRect)nFrame{
    HXSlideSegmentView *mSelf = [[HXSlideSegmentView alloc] initWithFrame:nFrame];
    mSelf->_showCount = showCount;
    mSelf->_surplusCount = (showCount/2)+1;
    mSelf->_selectIndex = index;
    mSelf.backgroundColor = RGB_COLOR(239, 239, 244);
    mSelf.layer.masksToBounds = true;
    mSelf.layer.cornerRadius = nFrame.size.height/2;
    [mSelf addTitleArray:tArray];
    [mSelf initScrollview];
    return mSelf;
}

- (void)addTitleArray:(NSArray *)array{
    _titleArray = [[NSMutableArray alloc] init];
    //增加一个头一个尾
    for (int i = 0; i < array.count+_surplusCount*2; i++) {
        if (i<_surplusCount) {
            [_titleArray addObject:array[array.count-_surplusCount+i]];
        }else if (i>=(array.count+_surplusCount)){
            [_titleArray addObject:array[i-(array.count+_surplusCount)]];
        }else{
            [_titleArray addObject:array[i-_surplusCount]];
        }
    }
}

- (void)initScrollview{
    CGFloat width = self.frame.size.width/_showCount;
    CGRect rect = CGRectMake(_showCount/2*width, 0, width, self.frame.size.height);
    _bkgView = [[UIView alloc] initWithFrame:rect];
    _bkgView.backgroundColor = [UIColor colorWithRed:220/255.0 green:30/255.0 blue:60/255.0 alpha:1];
    _bkgView.layer.masksToBounds = true;
    _bkgView.layer.cornerRadius = self.frame.size.height/2;
    [self addSubview:_bkgView];
    self.scrollView = [[UIScrollView alloc] initWithFrame:rect];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(width *(_titleArray.count+(_surplusCount*2)), rect.size.height);
    self.scrollView.showsVerticalScrollIndicator = false;
    self.scrollView.showsHorizontalScrollIndicator = false;
    self.scrollView.pagingEnabled = true;
    self.scrollView.bounces = false;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    self.scrollView.layer.masksToBounds = false;
    
    [self addTitleWithRect:rect];
    [self addRecognizer];
}

- (void)addTitleWithRect:(CGRect)rect{
    CGRect tRect = rect;
    tRect.origin.x = 0;
    for (int i = 0; i<_titleArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:tRect];
        label.text = _titleArray[i];
        label.tag = 1000+i;
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        [self.scrollView addSubview:label];
        tRect.origin.x += tRect.size.width;
    }
    _nowLabelIndex = _selectIndex+_surplusCount;
    UILabel *label = [self.scrollView viewWithTag:_nowLabelIndex + 1000];
    label.textColor = [UIColor whiteColor];
    [self.scrollView setContentOffset:CGPointMake((_selectIndex+_surplusCount)*rect.size.width, 0) animated:false];
}

- (void)addRecognizer{
    _recognizerView = [[UIView alloc] initWithFrame:self.bounds];
    _recognizerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_recognizerView];
    [self bringSubviewToFront:_recognizerView];
    
    //新建tap手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    //设置点击次数和点击手指数
    tapGesture.numberOfTapsRequired = 1; //点击次数
    tapGesture.numberOfTouchesRequired = 1; //点击手指数
    tapGesture.delegate = self;
    [_recognizerView addGestureRecognizer:tapGesture];
    
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫的方向
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; //默认向右
    [_recognizerView addGestureRecognizer:swipeGesture];
    
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫的方向
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft; //默认向左
    [_recognizerView addGestureRecognizer:swipeGestureLeft];
}

- (void)tapGesture:(UITapGestureRecognizer *)recognizer{
    CGPoint point = [recognizer locationInView:_recognizerView];
    int showIndex = _showCount/2;
    CGFloat width = self.frame.size.width/_showCount;
    int selectIndex = (int)(point.x/width);
    if (selectIndex == showIndex) {
        return;
    }
    if (selectIndex < showIndex) {
        [self.scrollView setContentOffset:CGPointMake((self.scrollView.contentOffset.x - (showIndex - selectIndex)*width), 0) animated:true];
    }else if (selectIndex > showIndex){
        [self.scrollView setContentOffset:CGPointMake((self.scrollView.contentOffset.x + (selectIndex - showIndex)*width), 0) animated:true];
    }
}

//轻扫手势触发方法
-(void)swipeGesture:(id)sender
{
    CGFloat width = self.frame.size.width/_showCount;
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //向左轻扫做的事情
        [self.scrollView setContentOffset:CGPointMake((self.scrollView.contentOffset.x + width), 0) animated:true];
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        //向右轻扫做的事情
        [self.scrollView setContentOffset:CGPointMake((self.scrollView.contentOffset.x - width), 0) animated:true];
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return true;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat width = self.frame.size.width/_showCount;
    //    NSLog(@"%f",scrollView.contentOffset.x/width);
    int nowIndex = scrollView.contentOffset.x/(int)width;
    NSLog(@"nowIndex = %d",nowIndex);
    if (nowIndex < _surplusCount) {
        int newIndex = (int)_titleArray.count-_surplusCount-1;
        [self refreshLabelTextColorWithNowLabelIndex:newIndex];
        [self.scrollView setContentOffset:CGPointMake(newIndex*width, 0) animated:false];
        return;
    }else if (nowIndex >= (_titleArray.count - _surplusCount)){
        [self refreshLabelTextColorWithNowLabelIndex:_surplusCount];
        [self.scrollView setContentOffset:CGPointMake(((_surplusCount)*width), 0) animated:false];
        return;
    }
    [self refreshLabelTextColorWithNowLabelIndex:nowIndex];

}

- (void)refreshLabelTextColorWithNowLabelIndex:(int)nowIndex{
    if (nowIndex != _nowLabelIndex) {
        if (self.SelectTitleIndexBlock) {
            self.SelectTitleIndexBlock(nowIndex-_surplusCount);
        }
        UILabel *nowLabel = [self.scrollView viewWithTag:nowIndex+1000];
        UILabel *oldLabel = [self.scrollView viewWithTag:_nowLabelIndex+1000];
        
        oldLabel.textColor = [UIColor blackColor];
        nowLabel.textColor = [UIColor whiteColor];
        _nowLabelIndex = nowIndex;
    }
}

@end
