//
//  Singleton.h
//  Chyea
//
//  Created by Usman Ahmed on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Singleton : NSObject
{
    BOOL isOutletActivated  ;
    int isFromSync;
    NSMutableDictionary *versionDict;
    int internalCalledService;
    BOOL isPromoFromAccount  ;
    BOOL isFirstSignup  ;
    BOOL isFirstPushMsg  ;
    BOOL isStartImage;
    NSString *letsShow;
    int selectedOption;


}
@property (nonatomic, assign) BOOL isOutletActivated;
@property (nonatomic, assign) int isFromSync;
@property (nonatomic, strong) NSMutableDictionary *versionDict;
@property (nonatomic, assign) int internalCalledService;
@property (nonatomic, assign) BOOL isPromoFromAccount;
@property (nonatomic, assign) BOOL isFirstSignup;
@property (nonatomic, assign) BOOL isFirstPushMsg;
@property (nonatomic, assign) BOOL isStartImage;
@property (nonatomic, strong) NSString *letsShow;
@property (nonatomic, assign) int selectedOption;


+ (Singleton*) retrieveSingleton;
+ (void) destroyMySingleton;


@end
