//
//  SWDefaults.h
//  SWPlatform
//
//  Created by Irfan Bashir on 5/9/12.
//  Copyright (c) 2012 UCS Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJSONDeserializer.h"
#import "CJSONSerializer.h"
@interface SWDefaults : NSObject

+ (void)initializeDefaults;

+ (NSString *)username;
+ (void)setUsername:(NSString *)username;

+ (NSString *)birthDate;
+ (void)setBirthDate:(NSString *)username;

+ (NSMutableArray *)outletArray;
+ (void)setOutletArray:(NSMutableArray *)ref;

+ (NSMutableArray *)faqSectionArray;
+ (void)setFAQSectionArray:(NSMutableArray *)ref;

+ (NSMutableDictionary *)contactArray;
+ (void)setContactArray:(NSMutableDictionary *)ref;

+ (NSMutableDictionary *)aboutArray;
+ (void)setAboutArray:(NSMutableDictionary *)ref;

+ (NSMutableArray *)agentArray;
+ (void)setAgentArray:(NSMutableArray *)ref;

+ (NSMutableArray *)adsArray;
+ (void)setAdsArray:(NSMutableArray *)ref;

+ (NSMutableDictionary *)userProfile;
+ (void)setUserProfile:(NSMutableDictionary *)ref;

+ (NSString *)adShownDate;
+ (void)setAdShownDate:(NSString *)ref;

+ (NSString *)pushMessageID;
+ (void)setPushMessageID:(NSString *)ref;

+ (NSString *)userEmailForAutoActive;
+ (void)setUserEmailForAutoActive:(NSString *)username;
+ (void)removeUserEmailForAutoActive;

+ (NSString *)deviceId;
+ (void)setDeviceId:(NSString *)deviceId;

+ (NSString *)totalSaved;
+ (void)setTotalSaved:(NSString *)deviceId;

+ (NSMutableArray *)notificationArray;
+ (void)setNotificationArray:(NSMutableArray *)ref;

+ (NSString *)notificatinoCount;
+ (void)setNotificatinoCount:(NSString *)deviceId;

+ (NSMutableArray *)favArray;
+ (void)setFavArray:(NSMutableArray *)ref;

+ (NSString *)profilePicture;
+ (void)setProfilePicture:(NSString *)deviceId;

+ (NSMutableArray *)pushNotificationArray;
+ (void)setPushNotificationArray:(NSMutableArray *)ref;

+ (NSString *)firstInstallation;
+ (void)setFirstInstallation:(NSString *)username;

+ (NSMutableDictionary *)premiumDictionary;
+ (void)setPremiumDictionary:(NSMutableDictionary *)ref;

+ (NSMutableArray *)flightArray;
+ (void)setFlightArray:(NSMutableArray *)ref;

+ (NSMutableArray *)trainArray;
+ (void)setTrainArray:(NSMutableArray *)ref;

+ (NSMutableArray *)busArray;
+ (void)setBusArray:(NSMutableArray *)ref;


@end
