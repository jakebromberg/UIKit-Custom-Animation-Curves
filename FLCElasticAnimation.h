//
//  FLCElasticAnimation.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimation.h"
#import "FLCElasticAnimationParameters.h"

@interface FLCElasticAnimation : FLCAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCElasticAnimationParameters *)parameters;

+ (FLCMediaTimingFunction)standardEaseIn;
+ (FLCMediaTimingFunction)standardEaseOut;

@property (nonatomic, readonly) FLCElasticAnimationParameters *parameters;

@end
