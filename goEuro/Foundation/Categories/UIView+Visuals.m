//
//  UIView+Visuals.m
//
//  Created by Heiko Dreyer on 25.05.11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//

#import "UIView+Visuals.h"
#import "Defines.h"

// Degree -> Rad
#define degToRad(x) (M_PI * (x) / 180.0)

@implementation UIView (Visuals)

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addSubviewWithBounce:(UIView*)theView
{
    theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [theView setHidden:NO];
    [UIView animateWithDuration:0.3/1.5 animations:^{
        theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                theView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}

-(void)cornerRadius: (CGFloat)radius strokeSize: (CGFloat)size color: (UIColor *)color
{
    self.layer.cornerRadius = radius;
    self.layer.borderColor = UIColorFromRGB(0xE2E6E9).CGColor;
    self.layer.borderWidth = size;
}

-(void)viewGrayBorder
{
    self.layer.borderColor = UIColorFromRGB(0xE2E6E9).CGColor;
    self.layer.borderWidth = 1;
}
///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)shadowWithColor: (UIColor *)color 
                offset: (CGSize)offset 
               opacity: (CGFloat)opacity 
                radius: (CGFloat)radius
{
    self.clipsToBounds = NO;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

- (void) shake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 0.6;
    animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
    [self.layer addAnimation:animation forKey:@"shake"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeFromSuperviewWithFadeDuration: (NSTimeInterval)duration
{
    [UIView beginAnimations: nil context: NULL];
	[UIView setAnimationBeginsFromCurrentState: YES];
	[UIView setAnimationDuration: duration];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector: @selector(removeFromSuperview)];
    self.alpha = 0.0;
	[UIView commitAnimations];	
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addSubview: (UIView *)subview withTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration;
{
	[UIView beginAnimations: nil context: NULL];
	[UIView setAnimationDuration: duration];
	[UIView setAnimationTransition: transition forView: self cache: YES];
	[self addSubview: subview];
	[UIView commitAnimations];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeFromSuperviewWithTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration
{
	[UIView beginAnimations: nil context: NULL];
	[UIView setAnimationDuration: duration];
	[UIView setAnimationTransition: transition forView: self.superview cache: YES];
	[self removeFromSuperview];
	[UIView commitAnimations];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)rotateByAngle: (CGFloat)angle 
            duration: (NSTimeInterval)duration 
         autoreverse: (BOOL)autoreverse
         repeatCount: (CGFloat)repeatCount
      timingFunction: (CAMediaTimingFunction *)timingFunction
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    rotation.toValue = [NSNumber numberWithFloat: degToRad(angle)];
    rotation.duration = duration;
    rotation.repeatCount = repeatCount;
    rotation.autoreverses = autoreverse;
    rotation.removedOnCompletion = NO;
	rotation.fillMode = kCAFillModeBoth;
	rotation.timingFunction = timingFunction != nil ? timingFunction : [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation: rotation forKey: @"rotationAnimation"];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)moveToPoint: (CGPoint)newPoint 
          duration: (NSTimeInterval)duration 
       autoreverse: (BOOL)autoreverse
       repeatCount: (CGFloat)repeatCount
    timingFunction: (CAMediaTimingFunction *)timingFunction
{
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath: @"position"];
    move.toValue = [NSValue valueWithCGPoint: newPoint];
    move.duration = duration;
    move.removedOnCompletion = NO;
    move.repeatCount = repeatCount;
    move.autoreverses = autoreverse;
	move.fillMode = kCAFillModeBoth;
	move.timingFunction = timingFunction != nil ? timingFunction : [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation: move forKey: @"positionAnimation"];
}

# pragma mark - Setters

- (void) setFrameWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            width,
                            self.frame.size.height);
}

- (void) setFrameHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            height);
}

- (void) setFrameX:(CGFloat)x
{
    self.frame = CGRectMake(x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
}

- (void) setFrameY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x,
                            y,
                            self.frame.size.width,
                            self.frame.size.height);
}

# pragma mark - Getters

- (CGFloat) frameWidth
{
    return self.frame.size.width;
}

- (CGFloat) frameHeight
{
    return self.frame.size.height;
}

- (CGFloat) frameX
{
    return self.frame.origin.x;
}

- (CGFloat) frameY
{
    return self.frame.origin.y;
}


@end


@interface UINavigationController(indexPoping)
- (void)popToViewControllerAtIndex:(NSInteger)newVCsIndex animated:(BOOL)animated;
@end

@implementation UINavigationController(indexPoping)
- (void)popToViewControllerAtIndex:(NSInteger)newVCsIndex animated:(BOOL)useAnimation
{
    if (newVCsIndex < [self.viewControllers count]) {
        [self popToViewController:[self.viewControllers objectAtIndex:newVCsIndex] animated:useAnimation];
    }
}
@end


