//
//  FLCPolynomialAnimation.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimation.h"
#import "FLCPolynomialAnimationParameters.h"

/**
 *  First-degree polynomial animation
 */
@interface FLCPolynomialAnimation : FLCAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCPolynomialAnimationParameters *)parameters;

+ (FLCMediaTimingFunction)linearEaseIn;
+ (FLCMediaTimingFunction)linearEaseOut;

+ (FLCMediaTimingFunction)quadraticEaseIn;
+ (FLCMediaTimingFunction)quadraticEaseOut;

+ (FLCMediaTimingFunction)cubicEaseIn;
+ (FLCMediaTimingFunction)cubicEaseOut;

+ (FLCMediaTimingFunction)quarticEaseIn;
+ (FLCMediaTimingFunction)quarticEaseOut;

+ (FLCMediaTimingFunction)quinticEaseIn;
+ (FLCMediaTimingFunction)quinticEaseOut;

@property (nonatomic, readonly) FLCPolynomialAnimationParameters *parameters;

@end
