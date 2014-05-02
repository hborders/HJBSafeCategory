//
//  HJBMyClassThatUsesMyCategory.m
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#import "HJBMyClassThatUsesMyCategory.h"
#import "NSObject+HJBMyCategory.h"

@implementation HJBMyClassThatUsesMyCategory

- (id)init {
    self = [super init];
    if (self) {
        [self hjb_myMethod];
    }
    
    return self;
}

@end
