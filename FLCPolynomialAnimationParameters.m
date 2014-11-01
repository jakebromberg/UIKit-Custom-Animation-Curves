//
//  FLCPolynomialAnimationParameters.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCPolynomialAnimationParameters.h"

@implementation FLCPolynomialAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing power:(CGFloat)power
{
    if (!(self = [super initWithEasing:easing])) return nil;
    
    _power = power;
    
    return self;
}

@end
