//
//  NSObject+HJBMyCategory.m
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#import "NSObject+HJBMyCategory.h"

/*
 * This is how safe categories should be used.
 * It is included in the HJBSafeCategory-Runtime-Failure target because the safety check will cause a linker failure.
 * We want the build to succeed to show a runtime failure.
 */
HJBSafeCategoryImplementation(NSObject, HJBMyCategory)

- (void)hjb_myMethod {
    NSLog(@"My Method!");
}

@end
