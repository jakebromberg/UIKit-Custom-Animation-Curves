//
//  FLCMediaTimingParameters.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FLCMediaTimingEasing)
{
    FLCMediaTimingEaseIn,
    FLCMediaTimingEaseOut,
};

@interface FLCAnimationParameters : NSObject

- (instancetype)initWithEasing:(FLCMediaTimingEasing)easing;

@property (nonatomic, readonly) FLCMediaTimingEasing easing;

@end
