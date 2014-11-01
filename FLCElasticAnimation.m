//
//  FLCElasticAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCElasticAnimation.h"

static const CGFloat kStandardSpringiness = 8.f;
static const CGFloat kStandardOscillations = 1.f;

@implementation FLCElasticAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCElasticAnimationParameters *)parameters;
{
    return [super functionWithParameters:parameters];
}

+ (FLCMediaTimingFunction)standardEaseIn
{
    return [self functionWithParameters:[[FLCElasticAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn springiness:kStandardSpringiness oscillations:kStandardOscillations]];
}

+ (FLCMediaTimingFunction)standardEaseOut
{
    return [self functionWithParameters:[[FLCElasticAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut springiness:kStandardSpringiness oscillations:kStandardOscillations]];
}

- (FLCMediaTimingFunction)springTime
{
    static const CGFloat kEpsilon = 0.0001;
    
    if (fabs(self.parameters.springiness) > kEpsilon)
        return Exponentiate(self.parameters.springiness);
    
    return ^CGFloat(CGFloat time) { return time; };
}

- (FLCMediaTimingFunction)timingFunction
{
    const FLCMediaTimingFunction springTime = self.springTime;
    
    return ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time) {
        return springTime(time) * sin(time * ((2 * M_PI * self.parameters.oscillations) + (M_PI / 2)));
    });
}

@end
