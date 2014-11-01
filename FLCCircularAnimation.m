//
//  FLCCircularAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/11/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCCircularAnimation.h"

@interface FLCCircularAnimation ()

@property (nonatomic, strong) FLCMediaTimingFunction partiallyEvaluatedFunction;

@end

@implementation FLCCircularAnimation

+ (FLCMediaTimingFunction)standardEaseIn
{
    return [super functionWithParameters:[[FLCAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseIn]];
}

+ (FLCMediaTimingFunction)standardEaseOut
{
    return [super functionWithParameters:[[FLCAnimationParameters alloc] initWithEasing:FLCMediaTimingEaseOut]];
}

- (FLCMediaTimingFunction)timingFunction
{
    if (!self.partiallyEvaluatedFunction)
    {
        self.partiallyEvaluatedFunction = ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time) {
            return 1 - sqrt(1 - pow(time, 2));
        });
    }
    
    return self.partiallyEvaluatedFunction;
}

@end
