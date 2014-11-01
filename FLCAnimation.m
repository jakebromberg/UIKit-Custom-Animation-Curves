//
//  FLCAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimation.h"

FLCMediaTimingFunction ConditionallyInvert(FLCMediaTimingEasing easing, FLCMediaTimingFunction computation)
{
    if (easing == FLCMediaTimingEaseOut)
    {
        return ^(CGFloat time) { return 1 - computation(1 - time); };
    }
    else
    {
        return ^(CGFloat time) { return computation(time); };
    }
}

FLCMediaTimingFunction Exponentiate(CGFloat exp)
{
    return ^CGFloat(CGFloat time)
    {
        return (pow(M_E, exp * time) - 1) / (pow(M_E, exp) - 1);
    };
}


@implementation FLCAnimation

- (instancetype)initWithParameters:(FLCAnimationParameters *)parameters
{
    if (!(self = [super init])) return nil;
    
    _parameters = parameters;
    
    return self;
}

- (FLCMediaTimingFunction)function
{
    return nil;
}

#pragma mark factory methods

+ (FLCMediaTimingFunction)functionWithParameters:(FLCAnimationParameters *)parameters
{
    FLCAnimation *animation = [[self alloc] initWithParameters:parameters];
    return [animation timingFunction];
}

+ (FLCMediaTimingFunction)standardEaseIn
{
    return nil;
}

+ (FLCMediaTimingFunction)standardEaseOut
{
    return nil;
}

@end
