//
//  FLCElasticAnimationParameters.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimationParameters.h"
#import "FLCExponentialAnimationParameters.h"

@interface FLCExponentialAnimationParameters : FLCAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing exponent:(CGFloat)exponent __attribute__((objc_designated_initializer));

@property (nonatomic, readonly) CGFloat exponent;

@end