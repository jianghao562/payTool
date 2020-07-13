//
//  JHMacros.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//


#ifndef JHDebugLog_h
#define JHDebugLog_h

#if __OBJC__

#ifdef DEBUG
#define JHLog(...) NSLog(__VA_ARGS__)
#else
#define JHLog(...)
#endif

#ifndef JHAssert
#define JHAssert( condition, ... ) NSCAssert( (condition) , ##__VA_ARGS__)
#endif

#ifndef JHFailAssert
#define JHFailAssert( ... ) JHAssert( (NO) , ##__VA_ARGS__)
#endif


#ifndef JHParameterAssert
#define JHParameterAssert( condition ) JHAssert( (condition) , @"Invalid parameter not satisfying: %@", @#condition)
#endif // JHParameterAssert

#endif

#endif /* JHDebugLog_h */
