//
//  FLCSineAnimation.m
//  FLConos
//
//  Created by Jake Bromberg on 7/11/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "FLCSineAnimation.h"

@implementation FLCSineAnimation

- (FLCMediaTimingFunction)timingFunction
{
    return ConditionallyInvert(self.parameters.easing, ^CGFloat(CGFloat time) {
        return 1 - sin((1 - time) * (M_PI / 2));
    });
}

@end
