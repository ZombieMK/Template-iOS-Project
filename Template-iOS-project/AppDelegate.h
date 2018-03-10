//
//  AppDelegate.h
//  Template iOS project
//
//  Created by Jovan Samardziski on 3/8/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NavigationController *navigationController;
@property (nonatomic) MainScreenController *mainScreenController;

@end

