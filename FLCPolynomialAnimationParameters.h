//
//  FLCPolynomialAnimationParameters.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimationParameters.h"

@interface FLCPolynomialAnimationParameters : FLCAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing power:(CGFloat)power __attribute__((objc_designated_initializer));

@property (nonatomic, readonly) CGFloat power;

@end
