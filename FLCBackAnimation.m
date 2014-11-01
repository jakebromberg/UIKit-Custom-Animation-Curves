//
//  FLCBackAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCBackAnimation.h"

@implementation FLCBackAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCBackAnimationParameters *)parameters;
{
    return [super functionWithParameters:parameters];
}

+ (FLCMediaTimingFunction)standardEaseIn
{
    return [self functionWithParameters:[[FLCBackAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn amplitude:7]];
}

+ (FLCMediaTimingFunction)standardEaseOut
{
    return [self functionWithParameters:[[FLCBackAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut amplitude:7]];
}

- (FLCMediaTimingFunction)timingFunction
{
    return ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time)
    {
        return pow(time, 3) - time * self.parameters.amplitude * sin(time * M_PI);
    });
}

@end
