//
//  FLCExponentialAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCExponentialAnimation.h"
#import "FLCExponentialAnimationParameters.h"

static const CGFloat kStandardExponent = 7.f;

@implementation FLCExponentialAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCExponentialAnimationParameters *)parameters
{
    return [super functionWithParameters:parameters];
}

+ (FLCMediaTimingFunction)standardEaseIn
{
    return [self functionWithParameters:[[FLCExponentialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn exponent:kStandardExponent]];
}

+ (FLCMediaTimingFunction)standardEaseOut
{
    return [self functionWithParameters:[[FLCExponentialAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut exponent:kStandardExponent]];
}

- (FLCMediaTimingFunction)timingFunction
{
    return ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time) {
        return Exponentiate(self.parameters.exponent)(time);
    });
}

@end
