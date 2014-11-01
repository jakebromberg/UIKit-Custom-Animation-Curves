//
//  FLCBackAnimation.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimation.h"
#import "FLCBackAnimationParameters.h"

@interface FLCBackAnimation : FLCAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCBackAnimationParameters *)parameters;

@property (nonatomic, readonly) FLCBackAnimationParameters *parameters;

@end
