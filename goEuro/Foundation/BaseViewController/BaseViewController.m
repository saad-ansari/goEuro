//
//  BaseViewController.m
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "BaseViewController.h"
#import "HttpClient.h"


@interface BaseViewController ()
{
    MBProgressHUD *progressHUD;
    Reachability *reachability;
}

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    httpManager = [Base new];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [ISMessages hideAlertAnimated:YES];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(goeuro_blue);

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}
#pragma mark - gestureRecognizer Delegate

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"Tapped");
    [ISMessages hideAlertAnimated:YES];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


-(void)setBorderColor:(UIView *)viewColor
{
    viewColor.layer.borderColor = UIColorFromRGB(list_divider).CGColor;
    viewColor.layer.borderWidth = 0.8f;
}

-(void)makeCurveCorner:(UIView*)view
{
    view.layer.cornerRadius=5.0;
    view.clipsToBounds=YES;
}

-(void)makeRoundCorner:(UIView*)view
{
    view.layer.cornerRadius=8.0;
    view.clipsToBounds=YES;
    
    //For Circle
//    view.clipsToBounds = YES;
//    view.layer.cornerRadius = view.layer.frame.size.width/2;
}



#pragma mark
#pragma mark - Indicator Method
- (void)showCustomLoadingIndicator:(UIView*)loadingView{

    if(progressHUD){
        [progressHUD removeFromSuperview];
    }
    progressHUD=nil;
    progressHUD = [[MBProgressHUD alloc] initWithView:loadingView];
    progressHUD.center = CGPointMake(self.view.frameWidth/2,self.view.frameHeight/2);

    progressHUD.color = [UIColor clearColor];
    progressHUD.tintColor = [UIColor clearColor];
    [loadingView addSubview:progressHUD];
//    [progressHUD show:YES];
    
    if(_circleViewOut)
    {
        [_circleViewOut removeFromSuperview];
    }
    _circleViewOut = nil;
    _circleViewOut = [DACircularProgressView new];
    _circleViewOut.backgroundColor = [UIColor clearColor];
    _circleViewOut.trackTintColor = [UIColor clearColor];
    _circleViewOut.progressTintColor = UIColorFromRGB(goeuro_blue);
    _circleViewOut.roundedCorners = 3;
    _circleViewOut.layer.anchorPoint = CGPointMake(0.5, 0.5);
    _circleViewOut.thicknessRatio = kLGRefreshViewCircleOutThicknessRatio;
    _circleViewOut.center = CGPointMake(self.view.frameWidth/2, self.view.frameHeight/2);
    [loadingView addSubview:_circleViewOut];
    
    if(_circleViewIn)
    {
        [_circleViewIn removeFromSuperview];
    }
    _circleViewIn = nil;
    _circleViewIn = [DACircularProgressView new];
    _circleViewIn.backgroundColor = [UIColor clearColor];
    _circleViewIn.trackTintColor = [UIColor clearColor];
    _circleViewIn.progressTintColor = UIColorFromRGB(goeuro_blue);
    _circleViewIn.roundedCorners = 3;
    _circleViewIn.layer.anchorPoint = CGPointMake(0.5, 0.5);
    _circleViewIn.center = CGPointMake(self.view.frameWidth/2, self.view.frameHeight/2 );
    _circleViewIn.transform = CGAffineTransformScale(_circleViewIn.transform, -0.7, 0.7);
    _circleViewIn.thicknessRatio = kLGRefreshViewCircleInThicknessRatio;
    [loadingView addSubview:_circleViewIn];
    
    NSTimeInterval duration = 0.2;
    
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = duration;
    animation.fromValue = [NSNumber numberWithFloat:1.f];
    animation.removedOnCompletion = NO;
    
    [_circleViewIn.layer addAnimation:animation forKey:@"opacityAnimation"];
    [_circleViewOut.layer addAnimation:animation forKey:@"opacityAnimation"];

    [_circleViewOut setProgress:kLGRefreshViewCircleOutMaxProgress animated:NO];
    [_circleViewIn setProgress:kLGRefreshViewCircleInMaxProgress animated:NO];
    
    if (![_circleViewOut.layer.animationKeys containsObject:@"rotationAnimation"])
    {
        CGFloat multiplier = 1000000.f;
        NSTimeInterval duration = 0.7 * multiplier;
        CGFloat rotations = 1.f * multiplier;
        
        float value = (M_PI * 2.0 * rotations);
        
        CABasicAnimation *rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.duration = duration;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = 1;
        
        rotationAnimation.toValue = [NSNumber numberWithFloat:value];
        
        [_circleViewOut.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
        rotationAnimation.toValue = [NSNumber numberWithFloat:-value];
        
        [_circleViewIn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}
- (void)hideCustomIndicator
{
	[progressHUD hide:YES];
    [_circleViewIn removeFromSuperview];
    [_circleViewOut removeFromSuperview];
}

- (BOOL)isNetworkAvailable
{
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleNetworkChange:) name: kReachabilityChangedNotification object: nil];
    
    reachability = [Reachability reachabilityForInternetConnection];
    
    [reachability startNotifier];
    
    BOOL hasInet;
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if          (remoteHostStatus == NotReachable)      {NSLog(@"no");      hasInet-=NO;   }
    else if     (remoteHostStatus == ReachableViaWiFi)  {NSLog(@"wifi");    hasInet-=YES;  }
    else if     (remoteHostStatus == ReachableViaWWAN)  {NSLog(@"cell");    hasInet-=YES;  }
    
    return hasInet;
}
- (void) handleNetworkChange:(NSNotification *)notice
{
    BOOL hasInet;
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if          (remoteHostStatus == NotReachable)      {NSLog(@"no");      hasInet-=NO;   }
    else if     (remoteHostStatus == ReachableViaWiFi)  {NSLog(@"wifi");    hasInet-=YES;  }
    else if     (remoteHostStatus == ReachableViaWWAN)  {NSLog(@"cell");    hasInet-=YES;  }
    
    if (hasInet)
    {
        [self showErrorAlert:ConnectionLostTitle andMessage:ConnectionLost];
    }
    else
    {
//        [self showSuccessAlert:ConnectionLostTitle andMessage:ConnectionLost];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

-(NSMutableArray *)sortArray:(NSArray *)arrayForSort forKey:(NSString *)key Ascending:(BOOL)asc
{
    NSSortDescriptor *sortDescriptor  = [[NSSortDescriptor alloc] initWithKey:key ascending:asc];
    return [[arrayForSort sortedArrayUsingDescriptors:@[sortDescriptor]] mutableCopy];
    
    
}

-(void)showSuccessAlert :(NSString *)title andMessage:(NSString *)message
{
    [self hideCustomIndicator];
    [ISMessages showCardAlertWithTitle:title
                               message:message
                              duration:3.f
                           hideOnSwipe:YES
                             hideOnTap:YES
                             alertType:ISAlertTypeSuccess alertPosition:0 didHide:nil];
}
-(void)showErrorAlert :(NSString *)title andMessage:(NSString *)message
{
    [self hideCustomIndicator];
    [ISMessages showCardAlertWithTitle:title
                               message:message
                              duration:3.f
                           hideOnSwipe:YES
                             hideOnTap:YES
                             alertType:ISAlertTypeError alertPosition:0 didHide:nil];
}
-(void)showWarnningAlert :(NSString *)title andMessage:(NSString *)message
{
    [self hideCustomIndicator];
    [ISMessages showCardAlertWithTitle:title
                               message:message
                              duration:3.f
                           hideOnSwipe:YES
                             hideOnTap:YES
                             alertType:ISAlertTypeWarning alertPosition:0 didHide:nil];
}
-(void)showInfoAlert :(NSString *)title andMessage:(NSString *)message
{
    [self hideCustomIndicator];
    [ISMessages showCardAlertWithTitle:title
                               message:message
                              duration:3.f
                           hideOnSwipe:YES
                             hideOnTap:YES
                             alertType:ISAlertTypeInfo alertPosition:0 didHide:nil];
}
-(NSString*)deviceUDID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uuidUserDefaults = [defaults objectForKey:@"uuid"];
    NSString *uuid = [UICKeyChainStore stringForKey:@"uuid"];
    if ( uuid && !uuidUserDefaults)
    {
        [defaults setObject:uuid forKey:@"uuid"];
        [defaults synchronize];
    }
    else if ( !uuid && !uuidUserDefaults )
    {
        NSString *uuidString = [[NSUUID UUID] UUIDString];
        [UICKeyChainStore setString:uuidString forKey:@"uuid"];
        [defaults setObject:uuidString forKey:@"uuid"];
        [defaults synchronize];
        uuid = [UICKeyChainStore stringForKey:@"uuid"];
    }
    else if ( ![uuid isEqualToString:uuidUserDefaults] )
    {
        [UICKeyChainStore setString:uuidUserDefaults forKey:@"uuid"];
        uuid = [UICKeyChainStore stringForKey:@"uuid"];
    }
    return uuid;
}

-(BOOL)isConnectionAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname (hostname);
    if (hostinfo == NULL){
        NSLog(@"-> no connection!\n");
        return NO;
    }
    else{
        NSLog(@"-> connection established!\n");
        return YES;
    }
}

- (NSString *)calculateDuration:(NSString *)oldTime secondDate:(NSString *)currentTime
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSDate *date11 = [df dateFromString:oldTime];
    NSDate *date21 = [df dateFromString:currentTime];
    NSTimeInterval interval = [date21 timeIntervalSinceDate:date11];
    int hours = (int)interval / 3600;
    int minutes = (interval - (hours*3600)) / 60;
    NSString *timeDiff = [NSString stringWithFormat:@"%d:%02d", hours, minutes];
    return timeDiff;
}



@end
