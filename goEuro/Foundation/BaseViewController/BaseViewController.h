//
//  BaseViewController.h
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Defines.h"
#import "NSString+Additions.h"
#import "NSDictionary+Additions.h"
#import "txtFldCategory.h"
#import "SWDefaults.h"
#import "UIView+Visuals.h"
#import "Base.h"
#import "SWDefaults.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "Singleton.h"
#import <CoreLocation/CoreLocation.h>
#import "UIImageView+AFNetworking.h"
#import "UICKeyChainStore.h"
#import "ISMessages.h"
#import "HttpClient.h"
#import "DACircularProgressView.h"
#import "CAPSPageMenu.h"
#import "LGRefreshView.h"
@interface BaseViewController : UIViewController
{
    Base *httpManager;
    Singleton *single;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLLocationCoordinate2D currentCoordinate;
    NSString *myLat;
    NSString *myLong;
    NSString * todayTimeStamp;
    

}
@property (strong, nonatomic) DACircularProgressView    *circleViewOut;
@property (strong, nonatomic) DACircularProgressView    *circleViewIn;
- (void)    setBorderColor:(UIView *)viewColor;
- (void)    makeRoundCorner:(UIView*)view;
- (void)    showCustomLoadingIndicator:(UIView*)loadingView;
- (void)    hideCustomIndicator;
- (BOOL)    isNetworkAvailable;

- (NSString *)  deviceUDID;
- (NSMutableArray *)sortArray:(NSArray *)arrayForSort forKey:(NSString *)key Ascending:(BOOL)asc;
- (void)showSuccessAlert     :(NSString *)title andMessage:(NSString *)message;
- (void)showErrorAlert       :(NSString *)title andMessage:(NSString *)message;
- (void)showWarnningAlert    :(NSString *)title andMessage:(NSString *)message;
- (void)showInfoAlert        :(NSString *)title andMessage:(NSString *)message;
- (BOOL)isConnectionAvailable;
- (void)makeCurveCorner:(UIView*)view;
- (NSString *)calculateDuration:(NSString *)oldTime secondDate:(NSString *)currentTime;

@end
