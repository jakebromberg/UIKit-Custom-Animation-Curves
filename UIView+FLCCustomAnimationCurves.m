//
//  UIView+FLCCustomAnimationCurves.m
//  FLConos
//
//  Created by Jake Bromberg on 7/10/14.
//  Copyright (c) 2014 Flat Cap. All rights reserved.
//

#import "UIView+FLCCustomAnimationCurves.h"

static const NSUInteger kAnimationSteps = 100;
static const CGFloat kFrameRate = 1.0f / (CGFloat)(kAnimationSteps - 1);

typedef NSArray *(*FLCAnimationValuesGenerator)(FLCMediaTimingFunction, id, id);

NSArray *CGFloatAnimationValues(FLCMediaTimingFunction function, NSValue *fromValue, NSValue *toValue)
{
#if CGFLOAT_IS_DOUBLE
    CGFloat fromFloat = [(NSNumber *)fromValue doubleValue];
    CGFloat toFloat = [(NSNumber *)toValue doubleValue];
#else
    CGFloat fromFloat = [(NSNumber *)fromValue floatValue];
    CGFloat toFloat = [(NSNumber *)toValue floatValue];
#endif

    NSMutableArray *values = [NSMutableArray arrayWithCapacity:kAnimationSteps];
    CGFloat t = 0.0f;
    
    for(NSUInteger frame = 0; frame < kAnimationSteps; frame++, t += kFrameRate)
    {
        CGFloat dT = function(t);
        CGFloat frameValue = fromFloat + dT * (toFloat - fromFloat);
        [values addObject:@(frameValue)];
    }
    
    return values;
}

NSArray *CGPointAnimationValues(FLCMediaTimingFunction function, NSValue *fromValue, NSValue *toValue)
{
    CGPoint fromPoint = [fromValue CGPointValue];
    CGPoint toPoint = [toValue CGPointValue];
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:kAnimationSteps];
    CGFloat t = 0.0f;
    
    for(NSUInteger frame = 0; frame < kAnimationSteps; frame++, t += kFrameRate)
    {
        CGFloat dT = function(t);

        CGPoint framePoint = (CGPoint) {
            .x = fromPoint.x + dT * (toPoint.x - fromPoint.x),
            .y = fromPoint.y + dT * (toPoint.y - fromPoint.y)
        };
        
        [values addObject:[NSValue valueWithCGPoint:framePoint]];
    }
    
    return values;
}

NSArray *CGRectAnimationValues(FLCMediaTimingFunction function, NSValue *fromValue, NSValue *toValue)
{
    CGRect fromRect = [fromValue CGRectValue];
    CGRect toRect = [toValue CGRectValue];
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:kAnimationSteps];
    CGFloat t = 0.0f;
    
    for(NSUInteger frame = 0; frame < kAnimationSteps; frame++, t += kFrameRate)
    {
        CGFloat dT = function(t);
        
        CGFloat x = fromRect.origin.x + dT * (toRect.origin.x - fromRect.origin.x);
        CGFloat y = fromRect.origin.y + dT * (toRect.origin.y - fromRect.origin.y);
        
        CGFloat width = fromRect.size.width + dT * (toRect.size.width - fromRect.size.width);
        CGFloat height = fromRect.size.height + dT * (toRect.size.height - fromRect.size.height);
        
        [values addObject:[NSValue valueWithCGRect:CGRectMake(x, y, width, height)]];
    }
    
    return values;
}

NSArray *CGAffineTransformAnimationValues(FLCMediaTimingFunction function, NSValue *fromValue, NSValue *toValue)
{
    CGAffineTransform fromTransform = [fromValue CGAffineTransformValue];
    CGAffineTransform toTransform = [toValue CGAffineTransformValue];

    NSMutableArray *values = [NSMutableArray arrayWithCapacity:kAnimationSteps];
    CGFloat t = 0.0f;
    
    for(NSUInteger frame = 0; frame < kAnimationSteps; frame++, t += kFrameRate)
    {
        CGFloat dT = function(t);

        CGAffineTransform frameTransform = (CGAffineTransform) {
            .a = fromTransform.a + dT * (toTransform.a - fromTransform.a),
            .b = fromTransform.b + dT * (toTransform.b - fromTransform.b),
            .c = fromTransform.c + dT * (toTransform.c - fromTransform.c),
            .d = fromTransform.d + dT * (toTransform.d - fromTransform.d),
            .tx = fromTransform.tx + dT * (toTransform.tx - fromTransform.tx),
            .ty = fromTransform.ty + dT * (toTransform.ty - fromTransform.ty)
        };
        
        [values addObject:[NSValue valueWithCGAffineTransform:frameTransform]];
    }
    
    return values;
}

NSArray *UIColorAnimationValues(FLCMediaTimingFunction function, UIColor *fromColor, UIColor *toColor)
{
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:kAnimationSteps];
    CGFloat t = 0.0f;
    
    CGFloat fromComponents[4];
    CGFloat toComponents[4];

    [fromColor getRed:&fromComponents[0] green:&fromComponents[1] blue:&fromComponents[2] alpha:&fromComponents[3]];
    
    [toColor getRed:&toComponents[0] green:&toComponents[1] blue:&toComponents[2] alpha:&toComponents[3]];
    
    for(NSUInteger frame = 0; frame < kAnimationSteps; frame++, t += kFrameRate)
    {
        CGFloat dT = function(t);
        
        UIColor *frameColor = [UIColor
            colorWithRed:fromComponents[0] + dT * (toComponents[0] - fromComponents[0])
                   green:fromComponents[1] + dT * (toComponents[1] - fromComponents[1])
                    blue:fromComponents[2] + dT * (toComponents[2] - fromComponents[2])
                   alpha:fromComponents[3] + dT * (toComponents[3] - fromComponents[3])];
        
        [values addObject:frameColor];
    }
    
    return values;
}

@implementation UIView (FLCCustomAnimations)

- (void)animateKeyPath:(NSString *)path
             fromValue:(id)fromValue
               toValue:(id)toValue
                 delay:(CGFloat)delay
              duration:(CGFloat)duration
        timingFunction:(FLCMediaTimingFunction)timingFunction
            completion:(void(^)(BOOL))completion
{
    FLCAnimationValuesGenerator function = [self animationFunctionWithValue:[self valueForKeyPath:path]];
    NSArray *animationValues = function(timingFunction, fromValue, toValue);

    [UIView animateKeyframesWithDuration:duration delay:delay options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^
     {
         for (NSUInteger i = 0; i < kAnimationSteps; i++)
         {
             CGFloat time = kFrameRate * (CGFloat)i;
             
             [UIView addKeyframeWithRelativeStartTime:time relativeDuration:kFrameRate animations:^
              {
                  [self setValue:animationValues[i] forKey:path];
              }];
         }
     } completion:completion];
}

- (FLCAnimationValuesGenerator)animationFunctionWithValue:(id)value
{
    if ([value isKindOfClass:[UIColor class]])
        return UIColorAnimationValues;
    
    if (![value respondsToSelector:@selector(objCType)])
        return nil;
    
    const char *valueEncoding = [value objCType];
    
    if (!strcmp(valueEncoding, @encode(CGFloat)))
    {
        return CGFloatAnimationValues;
    }
    else if (!strcmp(valueEncoding, @encode(CGPoint)))
    {
        return CGPointAnimationValues;
    }
    else if (!strcmp(valueEncoding, @encode(CGRect)))
    {
        return CGRectAnimationValues;
    }
    else if (!strcmp(valueEncoding, @encode(CGAffineTransform)))
    {
        return CGAffineTransformAnimationValues;
    }
    
    return nil;
}

@end
