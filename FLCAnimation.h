//
//  FLCAnimation.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLCAnimationParameters.h"

typedef CGFloat (^FLCMediaTimingFunction)(CGFloat time);

extern FLCMediaTimingFunction ConditionallyInvert(FLCMediaTimingEasing easing, FLCMediaTimingFunction computation);
extern FLCMediaTimingFunction Exponentiate(CGFloat exp);

/**
 *  FLCAnimation provides is an abstract class to animate your views using custom animation curves.
 *  Initialize an animation object with specified parameters, and retrieve its `timingFunction` to
 *  compute animation values over the range 0 to 1 inclusive.
 *
 *  See UIView+FLCCustomAnimationCurves.h to find out how to animate your views.
 */
@interface FLCAnimation : NSObject

+ (FLCMediaTimingFunction)functionWithParameters:(FLCAnimationParameters *)parameters;
- (instancetype)initWithParameters:(FLCAnimationParameters *)parameters __attribute__((objc_designated_initializer));

@property (nonatomic, readonly) FLCAnimationParameters *parameters;
@property (nonatomic, readonly) FLCMediaTimingFunction timingFunction;

@end
