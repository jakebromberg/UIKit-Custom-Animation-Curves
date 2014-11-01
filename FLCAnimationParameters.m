//
//  FLCMediaTimingParameters.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimationParameters.h"

@implementation FLCAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing
{
    if (!(self = [super init])) return nil;
    
    _easing = easing;
    
    return self;
}

@end
