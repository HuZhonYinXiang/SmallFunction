//
//  AppDelegate.h
//  SmallFunction
//
//  Created by 胡欣 on 2017/4/13.
//  Copyright © 2017年 胡欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

