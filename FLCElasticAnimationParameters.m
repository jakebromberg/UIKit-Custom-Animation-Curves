//
//  FLCElasticAnimationParameters.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCElasticAnimationParameters.h"

@implementation FLCElasticAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing springiness:(CGFloat)springiness oscillations:(CGFloat)oscillations
{
    if (!(self = [super initWithEasing:easing])) return nil;
    
    _springiness = springiness;
    _oscillations = oscillations;
    
    return self;
}

@end
