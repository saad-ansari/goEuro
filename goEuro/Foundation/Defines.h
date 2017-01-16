//
//  Defines.h
//  Templete
//
//  Created by Saad Ansari on 12/15/13.
//  Copyright (c) 2013 Saad Ansari. All rights reserved.
//

#import "Singleton.h"
#import "AppDelegate.h"

#define APIBaseURLString  @"https://api.myjson.com/bins/"
#define GoogleMapAPI @"AIzaSyDQ81xBZ8LGF9m_X4AdDIw3I_XIzQqCJjU"

#define ConnectionLostTitle @"Internet Connection Lost"
#define ConnectionLost @"You lost connection to the rest of the world. Go to a place that has some wireless internet juice and our offers will be up for grabs again :-)"

#define guzzleFormate @"dd-MM-yyyy"
#define guzzleEventFormate @"dd/MM/yyyy"

#define guzzleVersion @"version6"
#define guzzleOldVersion @"version5"

#define Log(fmt, ...) NSLog(fmt, ##__VA_ARGS__)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] != NSOrderedAscending)

#define IS_IPHONE_5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)

#define valueIF (([Singleton retrieveSingleton].isFromSync == 1) ? 100 : 10)
#define AppDelegateObj ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDHT  [[UIScreen mainScreen] bounds].size.width


#define IS_IOS_7    ([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0)?YES:NO

#define ALERT(TITLE,MSG) [[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:nil \
cancelButtonTitle:@"OK" \
otherButtonTitles:nil] show]

#define IS_EMPTY_STRING(str) (!(str) || ![(str) isKindOfClass:NSString.class] || [(str) length] == 0)

#define DB_NAME @"DBModel"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define DARK_MODERATE_BLUE [UIColor colorWithRed:36.0f/255.0f green:89.0f/255.0f blue:114.0f/255.0f alpha:1.0f]
#define guzzleErrorColor [UIColor colorWithRed:255 green:0 blue:0 alpha:0.5]
#define Helvetica_Neue_Light_13 [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0f]
#define Helvetica_Neue_Light_16 [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f]
#define Helvetica_Neue_Light_22 [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0f]

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define GroupHeaderTextColor    0x4C566C
#define ColorForBackground      0xEDEDED
#define ColorForAlternateRow    0xE5E5E5
#define ColorForHeaderRow       0xAEAEAE
#define ColorForRowBorder       0xD7D7D7
#define ColorForHeaderBorder    0xA8A8A8

#define list_item_title         0xFFFFFF
#define list_background         0x303030
#define list_background_pressed       0xFF9900
#define list_divider            0xFFA500

#define guzzle_purple   0x722F8D
#define guzzle_yellow   0xFBE824
#define guzzle_gray     0x9A9C9E
#define guzzle_green    0xB2D233
#define guzzle_orange   0xF89E24
#define guzzle_red      0xE76559
//#define guzzle_dark     0x5A6773
#define guzzle_dark     0x333333
#define guzzle_white    0xffffff
#define guzzle_border   0xDFDFDF
#define goeuro_blue 0x104C92
#define topBarButtonPadding 4.0


#define UIColorForHeader() [UIColor \
colorWithPatternImage:[UIImage imageNamed:@"headerBK.png" cache:NO]]

#define UIColorForPlainTable() [UIColor \
colorWithPatternImage:[UIImage imageNamed:@"grouptablebackground.png" cache:NO]]

#define RegularFontOfSize(value) [UIFont \
fontWithName:@"OpenSans-Regular" size:value]

#define BoldFontOfSize(value) [UIFont \
fontWithName:@"OpenSans-Bold" size:value]

#define LightFontOfSize(value) [UIFont \
fontWithName:@"OpenSans-Light" size:value]

#define BoldSemiFontOfSize(value) [UIFont \
fontWithName:@"OpenSans-Semibold" size:value]


#define RobotoRegularFontOfSize(value) [UIFont \
fontWithName:@"Roboto-Regular" size:value]

#define RobotoBoldFontOfSize(value) [UIFont \
fontWithName:@"Roboto-Bold" size:value]

#define RobotoLightFontOfSize(value) [UIFont \
fontWithName:@"Roboto-Light" size:value]

#define RobotoBoldSemiFontOfSize(value) [UIFont \
fontWithName:@"Roboto-Semibold" size:value]

#define RobotoMediumFontOfSize(value) [UIFont \
fontWithName:@"Roboto-Medium" size:value]

#define DARK_MODERATE_BLUE [UIColor colorWithRed:36.0f/255.0f green:89.0f/255.0f blue:114.0f/255.0f alpha:1.0f]
#define OPENSANSREGULAR_16 [UIFont fontWithName:@"opensansregular" size:16.0f]


#define kLGRefreshViewMainScreenSideMax         MAX(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)
#define kLGRefreshViewDeviceIsOld               (NSProcessInfo.processInfo.activeProcessorCount < 2)
#define kLGRefreshViewDegreesToRadians(d)       ((d) * M_PI / 180)
#define kLGRefreshViewCircleOutMaxProgress      0.93
#define kLGRefreshViewCircleInMaxProgress       0.9
#define kLGRefreshViewHeight                    64.f
#define kLGRefreshViewCircleOutSize             (kLGRefreshViewHeight * 0.5)
#define kLGRefreshViewCircleInSize              (kLGRefreshViewHeight * 0.3)
#define kLGRefreshViewCircleOutThicknessRatio   0.2
#define kLGRefreshViewCircleInThicknessRatio    0.25
