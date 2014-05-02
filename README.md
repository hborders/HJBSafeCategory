HJBSafeCategory
---------------

Author:

Heath Borders

HJBSafeCategory causes a linker failure if you forget to include a category file in your target. Normally, if you forget to include a category in your target, you just get a runtime failure:

    2014-05-01 23:31:51.987 HJBSafeCategory-Runtime-Failure[24472:90b] -[NSObject hjb_mySometimesUnsafeMethod]: unrecognized selector sent to instance 0x8e9c6e0
    2014-05-01 23:31:51.989 HJBSafeCategory-Runtime-Failure[24472:90b] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[NSObject hjb_mySometimesUnsafeMethod]: unrecognized selector sent to instance 0x8e9c6e0'
    *** First throw call stack:
    (
        0   CoreFoundation                      0x017ec1e4 __exceptionPreprocess + 180
        1   libobjc.A.dylib                     0x0156b8e5 objc_exception_throw + 44
        2   CoreFoundation                      0x01889243 -[NSObject(NSObject) doesNotRecognizeSelector:] + 275
        3   CoreFoundation                      0x017dc50b ___forwarding___ + 1019
        4   CoreFoundation                      0x017dc0ee _CF_forwarding_prep_0 + 14
        5   HJBSafeCategory-Runtime-Failure     0x00002e1c -[HJBAppDelegate application:didFinishLaunchingWithOptions:] + 684
        6   UIKit                               0x0022514f -[UIApplication _handleDelegateCallbacksWithOptions:isSuspended:restoreState:] + 309
        7   UIKit                               0x00225aa1 -[UIApplication _callInitializationDelegatesForURL:payload:suspended:] + 1810
        8   UIKit                               0x0022a667 -[UIApplication _runWithURL:payload:launchOrientation:statusBarStyle:statusBarHidden:] + 824
        9   UIKit                               0x0023ef92 -[UIApplication handleEvent:withNewEvent:] + 3517
        10  UIKit                               0x0023f555 -[UIApplication sendEvent:] + 85
        11  UIKit                               0x0022c250 _UIApplicationHandleEvent + 683
        12  GraphicsServices                    0x03791f02 _PurpleEventCallback + 776
        13  GraphicsServices                    0x03791a0d PurpleEventCallback + 46
        14  CoreFoundation                      0x01767ca5 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 53
        15  CoreFoundation                      0x017679db __CFRunLoopDoSource1 + 523
        16  CoreFoundation                      0x0179268c __CFRunLoopRun + 2156
        17  CoreFoundation                      0x017919d3 CFRunLoopRunSpecific + 467
        18  CoreFoundation                      0x017917eb CFRunLoopRunInMode + 123
        19  UIKit                               0x00229d9c -[UIApplication _run] + 840
        20  UIKit                               0x0022bf9b UIApplicationMain + 1225
        21  HJBSafeCategory-Runtime-Failure     0x000029dd main + 141
        22  libdyld.dylib                       0x01e31725 start + 0
        23  ???                                 0x00000001 0x0 + 1
    )
    libc++abi.dylib: terminating with uncaught exception of type NSException
    
Instead, HJBSafeCategory causes a linker failure:

    Undefined symbols for architecture i386:
      "_NSObjectHJBMyCategoryCanary", referenced from:
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatUsesMyCategory.o
          _NSObjectHJBMyCategoryCanaryCage in HJBAppDelegate.o
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatIncludeMyCategoryInItsInterface.o
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatUsesMyCategory.o
          _NSObjectHJBMyCategoryCanaryCage in HJBAppDelegate.o
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatIncludeMyCategoryInItsInterface.o
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatUsesMyCategory.o
          _NSObjectHJBMyCategoryCanaryCage in HJBAppDelegate.o
          _NSObjectHJBMyCategoryCanaryCage in HJBMyClassThatIncludeMyCategoryInItsInterface.o
    ld: symbol(s) not found for architecture i386
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

It works by declaring a global int namespaced to the category and referencing it with a static function implemented in the category's header file. The static function must use <code>__attribute__((constructor))</code> so that aggressive optimizations don't eliminate the global variable.

Use
---

Instead of declaring a category with:

    @interface NSObject (MyCategory) 
    
    @end

You simply declare it with:

    HJBSafeCategoryInterface(NSObject,MyCategory)
    
    @end

Similarly, you don't implement it with:

    @implementation NSObject (MyCategory)
    
    @end

You implement it with:

    HJBSafeCategoryImplementation(NSObject, MyCategory)
    
    @end

License
-------

This project is licensed under the [Apache 2 License](http://www.apache.org/licenses/LICENSE-2.0.html)
