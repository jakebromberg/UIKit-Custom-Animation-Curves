//
//  FLCBackingOutParameters.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCBackAnimationParameters.h"

@implementation FLCBackAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing amplitude:(CGFloat)amplitude
{
    if (!(self = [super initWithEasing:easing])) return nil;
    
    _amplitude = amplitude;
    
    return self;
}

@end
