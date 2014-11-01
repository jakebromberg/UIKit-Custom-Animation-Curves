//
//  UIView+FLCCustomAnimationCurves.h
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLCAnimation.h"

@interface UIView (FLCCustomAnimations)

/**
 *  Animates a property of a UIView using a custom timing curve.
 *
 *  @param path       The targeted key-value coded property to animate.
 *
 *  @param fromValue  The value from which we are animating. The type supplied to this parameter
 *                    corresponds to the type targeted by the keyPath. This parameter may either be
 *                    a UIColor object, or a Core Graphics primitive wrapped in an NSValue object.
 *                    This method accepts the following NSValue-wrapped Core Graphics primitives:
 *                      • CGFloat
 *                      • CGPoint
 *                      • CGRect
 *                      • CGAffineTransform
 *
 *  @param toValue    The value to which we animate the property.
 *
 *  @param delay      The amount of time (measured in seconds) to wait before beginning the
 *                    animations. Specify a value of 0 to begin the animations immediately.
 *
 *  @param duration   The total duration of the animations, measured in seconds. If you specify a
 *                    negative value or 0, the changes are made without animating them.
 *  @param curve      The custom animation curve function over which we animate.
 *
 *  @param completion A block object to be executed when the animation sequence ends. This block has
 *                    no return value and takes a single Boolean argument that indicates whether or
 *                    not the animations actually finished before the completion handler was called.
 *                    If the duration of the animation is 0, this block is performed at the
 *                    beginning of the next run loop cycle. This parameter may be `NULL`.
 *
 *  @author           Jake Bromberg
 */
- (void)animateKeyPath:(NSString *)path
             fromValue:(id)fromValue
               toValue:(id)toValue
                 delay:(CGFloat)delay
              duration:(CGFloat)duration
        timingFunction:(FLCMediaTimingFunction)timingFunction
            completion:(void(^)(BOOL))completion;

@end
