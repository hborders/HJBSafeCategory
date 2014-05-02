//
//  NSObject+HJBMySometimesUnsafeCategory.m
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#import "NSObject+HJBMySometimesUnsafeCategory.h"

/*
 * This is included in the HJBSafeCategory-Linker-Failure target because that target should only show linker failures, and if we don't include this file in the target it will be a runtime failure.
 */
@implementation NSObject (HJBMySometimesUnsafeCategory)

- (void)hjb_mySometimesUnsafeMethod {
    NSLog(@"My Sometimes Unsafe Method!");
}

@end
