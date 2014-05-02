//
//  HJBSafeCategory.h
//  HJBSafeCategory
//
//  Created by Heath Borders on 5/1/14.
//  Copyright (c) 2014 Heath Borders. All rights reserved.
//

#ifndef HJBSafeCategory_HJBSafeCategory_h
#define HJBSafeCategory_HJBSafeCategory_h

#define HJBSafeCategoryInterface( c , n ) \
\
extern int c##n##Canary; \
\
__attribute__((constructor)) static void c##n##CanaryCage() { \
c##n##Canary = 0; \
} \
\
@interface c (n)

#define HJBSafeCategoryImplementation( c , n ) \
\
int c##n##Canary = 0; \
\
@implementation c ( n )

#endif
