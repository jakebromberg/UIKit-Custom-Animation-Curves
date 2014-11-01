//
//  FLCElasticAnimationParameters.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCExponentialAnimationParameters.h"

@implementation FLCExponentialAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing exponent:(CGFloat)exponent
{
    if (!(self = [super initWithEasing:easing])) return nil;
    
    _exponent = exponent;
    
    return self;
}

@end
