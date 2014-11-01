//
//  FLCElasticAnimationParameters.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimationParameters.h"

@interface FLCElasticAnimationParameters : FLCAnimationParameters

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing springiness:(CGFloat)springiness oscillations:(CGFloat)oscillations __attribute__((objc_designated_initializer));

@property (nonatomic, readonly) CGFloat springiness;
@property (nonatomic, readonly) CGFloat oscillations;

@end
