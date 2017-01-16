//
//  SWDefaults.m
//  SWPlatform
//
//  Created by Saad Ansari on 5/9/12.
//  Copyright (c) 2012 Saad Asnari. All rights reserved.
//

#import "SWDefaults.h"


#define kUsernameKey    @"login"


@implementation SWDefaults

+ (void)initializeDefaults
{
    NSString *isActivationDone = [SWDefaults notificatinoCount];
    if (!isActivationDone || isActivationDone.length == 0)
    {
        [SWDefaults setNotificatinoCount:@"0"];
    }
}

+ (NSString *)username {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kUsernameKey];
}

+ (void)setUsername:(NSString *)username {
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:kUsernameKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString *)password {
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
}

+ (void)setPassword:(NSString *)password {
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSMutableDictionary *)selectedServerDictionary
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"serverDictionary"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}
+ (void)setSelectedServerDictionary:(NSMutableDictionary *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"serverDictionary"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+ (NSMutableDictionary *)premiumDictionary
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"premiumDictionary"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}
+ (void)setPremiumDictionary:(NSMutableDictionary *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"premiumDictionary"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)faqSectionArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"faqSectionArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setFAQSectionArray:(NSMutableArray *)ref
{
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"faqSectionArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)agentArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"agentArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setAgentArray:(NSMutableArray *)ref
{
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"agentArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)adsArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"adsArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setAdsArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"adsArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)outletArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"outletArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setOutletArray:(NSMutableArray *)ref
{
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"outletArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableDictionary *)contactArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"contactArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}
+ (void)setContactArray:(NSMutableDictionary *)ref
{
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"contactArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
+ (NSMutableDictionary *)aboutArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"aboutArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}
+ (void)setAboutArray:(NSMutableDictionary *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"aboutArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSMutableDictionary *)userProfile {
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"userProfile"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}


+ (void)setUserProfile:(NSMutableDictionary *)ref {
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"userProfile"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSDictionary *)licenseKey
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"licenseKey"] dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *testServerDict = [NSMutableDictionary dictionaryWithDictionary:[djsonSerializer deserializeAsDictionary:dataDict error:&error]  ] ;
    return testServerDict;
}
+ (void)setLicenseKey:(NSDictionary *)category
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:category error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"licenseKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)licenseIDForInfo
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"licenseIDForInfo"];
}
+ (void)setLicenseIDForInfo:(NSString *)ref
{
    [[NSUserDefaults standardUserDefaults] setObject:ref forKey:@"licenseIDForInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)licenseCustomerID
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"licenseCustomerID"];
}
+ (void)setLicenseCustomerID:(NSString *)ref
{
    [[NSUserDefaults standardUserDefaults] setObject:ref forKey:@"licenseCustomerID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)adShownDate
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"adShownDate"];
    
}
+ (void)setAdShownDate:(NSString *)ref
{
    [[NSUserDefaults standardUserDefaults] setObject:ref forKey:@"adShownDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)pushMessageID
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"pushMessageID"];
}
+ (void)setPushMessageID:(NSString *)ref
{
    [[NSUserDefaults standardUserDefaults] setObject:ref forKey:@"pushMessageID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)userEmailForAutoActive
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"emailForActive"];
}

+ (void)setUserEmailForAutoActive:(NSString *)username
{
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"emailForActive"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)removeUserEmailForAutoActive
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"emailForActive"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)birthDate
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"birthDate"];
}
+ (void)setBirthDate:(NSString *)username
{
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"birthDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)deviceId
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceId"];
}
+ (void)setDeviceId:(NSString *)deviceId
{
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"deviceId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)totalSaved
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"totalSaved"];
}
+ (void)setTotalSaved:(NSString *)deviceId
{
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"totalSaved"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)notificationArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"notificationArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setNotificationArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"notificationArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)notificatinoCount
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"notificatinoCount"];
}
+ (void)setNotificatinoCount:(NSString *)deviceId
{
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"notificatinoCount"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)profilePicture
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"profilePicture"];
}

+ (void)setProfilePicture:(NSString *)deviceId
{
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"profilePicture"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)favArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"favArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setFavArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"favArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)pushNotificationArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"pushNotificationArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setPushNotificationArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"pushNotificationArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)firstInstallation
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"firstInstallation"];
}
+ (void)setFirstInstallation:(NSString *)username
{
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"firstInstallation"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSMutableArray *)flightArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"flightArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setFlightArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"flightArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)trainArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"trainArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setTrainArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"trainArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableArray *)busArray
{
    CJSONDeserializer *djsonSerializer = [CJSONDeserializer deserializer];
    NSError *error;
    NSData* dataDict = [ [[NSUserDefaults standardUserDefaults] objectForKey:@"busArray"] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *testServerDict = [NSMutableArray arrayWithArray:[djsonSerializer deserializeAsArray:dataDict error:&error]  ];
    return testServerDict;
}
+ (void)setBusArray:(NSMutableArray *)ref
{
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer] ;
    NSError *error;
    NSData *dataDict = [jsonSerializer serializeObject:ref error:&error];
    NSString* stringDataDict = [[NSString alloc] initWithData:dataDict encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:stringDataDict forKey:@"busArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
