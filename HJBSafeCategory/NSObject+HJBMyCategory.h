//
//  NSObject+HJBMyCategory.h
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJBSafeCategory.h"

/*
 * This is how safe categories should be used.
 */
HJBSafeCategoryInterface(NSObject, HJBMyCategory)

- (void)hjb_myMethod;

@end
