//
//  HXCustomButton.m
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import "HXCustomButton.h"

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
/*          自定义按钮           */
@implementation HXCustomButton

+(instancetype)NewCustomButtonWithFrame:(CGRect)nFrame Images:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target{
    HXCustomButton *customButton = [HXCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = nFrame;
    [customButton setButtonImageWithDic:imageDic];
    if (title) {
        [customButton setTitle:title forState:UIControlStateNormal];
    }
    [customButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:13]];
    if (action && target) {
        [customButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return customButton;
}

- (void)setButtonImageWithDic:(NSDictionary *)imageDic{
    BOOL bgImage = false;
    if ([imageDic objectForKey:@"bgImage"]) {
        [self setBackgroundImage:[UIImage imageNamed:[imageDic objectForKey:@"bgImage"]] forState:UIControlStateNormal];
        bgImage = true;
    }
    if ([imageDic objectForKey:@"normalImage"]) {
        [self setImage:[UIImage imageNamed:[imageDic objectForKey:@"normalImage"]] forState:UIControlStateNormal];
    }else if (!bgImage){
        [self setImage:[UIImage imageNamed:@"HX_Share_Blue@2x"] forState:UIControlStateNormal];
    }
    if ([imageDic objectForKey:@"selectImage"]) {
        [self setImage:[UIImage imageNamed:[imageDic objectForKey:@"selectImage"]] forState:UIControlStateSelected];
    }else if (!bgImage){
        [self setImage:[UIImage imageNamed:@"HX_Share_Blue@2x"] forState:UIControlStateSelected];
    }
    if ([imageDic objectForKey:@"HighImage"]) {
        [self setImage:[UIImage imageNamed:[imageDic objectForKey:@"HighImage"]] forState:UIControlStateHighlighted];
    }else if (!bgImage) {
        [self setImage:[UIImage imageNamed:@"HX_Share_Blue@2x"] forState:UIControlStateHighlighted];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
/*          分享按钮           */
@interface HXShareButton()

@end

@implementation HXShareButton

+(instancetype)NewHXShareButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target{
    HXShareButton *shareButton = [HXShareButton NewCustomButtonWithFrame:nFrame Images:imageDic title:title SEL:action target:target];
    if (!action || !target) {
        [shareButton addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return shareButton;
}

//点击分享
- (void)shareClick{
    if (self.shareURL) {
        
    }
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
/*          收藏按钮           */
@interface HXCollectButton()

//是否已收藏
@property (nonatomic, assign) BOOL isCollect;

@end

@implementation HXCollectButton

+(instancetype)NewHXCollectButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target isCollect:(BOOL)isCollect{
    HXCollectButton *collectButton = [HXCollectButton NewCustomButtonWithFrame:nFrame Images:imageDic title:title SEL:action target:target];
    collectButton.isCollect = isCollect;
    if (!action || !target) {
        [collectButton addTarget:self action:@selector(collectClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return collectButton;
}

//点击收藏
- (void)collectClick{
    if (self.collectID.length < 1 || self.type.length < 1) {
        return;
    }
    if (self.isCollect) {
        
    }else{
        
    }
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
/*          点赞按钮           */
@interface HXPraiseButton()

//是否已点赞
@property (nonatomic, assign) BOOL isPraise;

@end

@implementation HXPraiseButton

+(instancetype)NewHXPraiseButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target isPraise:(BOOL)isPraise{
    HXPraiseButton *praiseButton = [HXPraiseButton NewCustomButtonWithFrame:nFrame Images:imageDic title:title SEL:action target:target];
    praiseButton.isPraise = isPraise;
    if (!action || !target) {
        [praiseButton addTarget:self action:@selector(praiseClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return praiseButton;
}

//点击点赞
- (void)praiseClick{
    
}

@end
