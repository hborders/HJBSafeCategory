//
//  HJBAppDelegate.m
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#import "HJBAppDelegate.h"
#import "NSObject+HJBMyCategory.h"
#import "NSObject+HJBMySometimesUnsafeCategory.h"
#import "HJBMyClassThatUsesMyCategory.h"
#import "HJBMyClassThatIncludeMyCategoryInItsInterface.h"

@implementation HJBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[NSObject new] hjb_myMethod];
    [[NSObject new] hjb_mySometimesUnsafeMethod];
    [HJBMyClassThatUsesMyCategory new];
    [HJBMyClassThatIncludeMyCategoryInItsInterface new];
    
    return YES;
}

@end
