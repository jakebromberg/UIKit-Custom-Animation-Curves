//
//  FLCExponentialAnimation.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCAnimation.h"
#import "FLCExponentialAnimationParameters.h"

@interface FLCExponentialAnimation : FLCAnimation

+ (FLCMediaTimingFunction)functionWithParameters:(FLCExponentialAnimationParameters *)parameters;
+ (FLCMediaTimingFunction)standardEaseIn;
+ (FLCMediaTimingFunction)standardEaseOut;

@property (nonatomic, readonly) FLCExponentialAnimationParameters *parameters;

@end
