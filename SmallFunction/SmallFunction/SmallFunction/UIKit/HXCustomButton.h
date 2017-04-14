//
//  HXCustomButton.h
//  Fonction Control
//
//  Created by 胡欣 on 2017/4/12.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>

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
@interface HXCustomButton : UIButton

/*
    *初始化一个button
    -nFrame     button的frame
    -imageDic   图片字典可传空使用默认图片 可只传背景图片    @{@"bgImage":背景图片,@"normalImage":普通状态图片,
                                                        @"selectImage":选择状态图片,@"HighImage":点击时图片}
    -title      button的title    可传空
 */
+(instancetype)NewCustomButtonWithFrame:(CGRect)nFrame Images:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target;

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
/*          自定义分享按钮           */
@interface HXShareButton : HXCustomButton

/*
    *使用统一分享时使用
    -shareURL       分享的URL
    -shareImage     分享的图片
    -shareTitle     分享的标题
    -shareContent   分享的内容
*/
@property (nonatomic, copy)     NSString    *shareURL;
@property (nonatomic, strong)   UIImage     *shareImage;
@property (nonatomic, copy)     NSString    *shareTitle;
@property (nonatomic, copy)     NSString    *shareContent;

/*
    *初始化方法
    -nFrame     button的frame
    -imageDic   图片字典可传空使用默认图片 可只传背景图片    @{@"bgImage":背景图片,@"normalImage":普通状态图片,
                                                        @"selectImage":选择状态图片,@"HighImage":点击时图片}
    -title      button的title    可传空
    -action     button的点击方法，传空使用统一分享，需赋值url
    -target     button调用点击方法的对象，传空使用统一分享，需赋值url
 */
+(instancetype)NewHXShareButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target;

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
@interface HXCollectButton : HXCustomButton

//收藏数
@property (nonatomic, assign)   NSInteger   collectNum;
//收藏产品的ID
@property (nonatomic, copy)     NSString    *collectID;
//收藏的类型
@property (nonatomic, copy)     NSString    *type;

/*
    *初始化方法
    -nFrame     button的frame
    -imageDic   图片字典可传空使用默认图片 可只传背景图片    @{@"bgImage":背景图片,@"normalImage":普通状态图片,
                                                        @"selectImage":选择状态图片,@"HighImage":点击时图片}
    -title      button的title    可传空
    -action     button的点击方法，传空使用统一分享，需赋值url
    -target     button调用点击方法的对象，传空使用统一分享，需赋值url
    -isCollect  是否已收藏
 */
+(instancetype)NewHXCollectButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target isCollect:(BOOL)isCollect;

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
@interface HXPraiseButton : HXCustomButton

//收藏数
@property (nonatomic, assign)   NSInteger   collectNum;
//收藏产品的ID
@property (nonatomic, copy)     NSString    *collectID;
//收藏的类型
@property (nonatomic, copy)     NSString    *type;

/*
 *初始化方法
    -nFrame     button的frame
    -imageDic   图片字典可传空使用默认图片 可只传背景图片    @{@"bgImage":背景图片,@"normalImage":普通状态图片,
                                                        @"selectImage":选择状态图片,@"HighImage":点击时图片}
    -title      button的title    可传空
    -action     button的点击方法，传空使用统一分享，需赋值url
    -target     button调用点击方法的对象，传空使用统一分享，需赋值url
    -isPraise   是否已收藏
 */
+(instancetype)NewHXPraiseButtonWithFrame:(CGRect)nFrame shareImages:(NSDictionary *)imageDic title:(NSString *)title SEL:(SEL)action target:(id)target isPraise:(BOOL)isPraise;

@end
