//
//  FLCPolynomialAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCPolynomialAnimation.h"

@implementation FLCPolynomialAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCPolynomialAnimationParameters *)parameters;
{
    return [super functionWithParameters:parameters];
}

- (FLCMediaTimingFunction)timingFunction
{
    return ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time) {
        return pow(time, self.parameters.power);
    });
}

#pragma mark factory methods

+ (FLCMediaTimingFunction)linearEaseIn
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn power:1]];
}

+ (FLCMediaTimingFunction)linearEaseOut
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut power:1]];
}

+ (FLCMediaTimingFunction)quadraticEaseIn
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn power:2]];
}

+ (FLCMediaTimingFunction)quadraticEaseOut
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut power:2]];
}

+ (FLCMediaTimingFunction)cubicEaseIn
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn power:3]];
}

+ (FLCMediaTimingFunction)cubicEaseOut
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut power:3]];
}

+ (FLCMediaTimingFunction)quarticEaseIn
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn power:4]];
}

+ (FLCMediaTimingFunction)quarticEaseOut
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut power:4]];
}

+ (FLCMediaTimingFunction)quinticEaseIn
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn power:5]];
}

+ (FLCMediaTimingFunction)quinticEaseOut
{
    return [self functionWithParameters:[[FLCPolynomialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut power:5]];
}

@end
