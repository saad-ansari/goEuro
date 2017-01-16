//
//  Singleton.m
//  Chyea
//
//  Created by Usman Ahmed on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"
@implementation Singleton

@synthesize isOutletActivated;
@synthesize isFromSync,versionDict,internalCalledService,isPromoFromAccount,isFirstSignup,isFirstPushMsg,isStartImage,letsShow,selectedOption;
static Singleton *sharedSingleton = nil;

+ (Singleton*) retrieveSingleton {
	@synchronized(self) {
		if (sharedSingleton == nil) {
			sharedSingleton = [[Singleton alloc] init];
		}
	}
	return sharedSingleton;
}

+ (id) allocWithZone:(NSZone *) zone {
	@synchronized(self) {
		if (sharedSingleton == nil) {
			sharedSingleton = [super allocWithZone:zone];
			return sharedSingleton;
		}
	}
	return nil;
}
+ (void) destroyMySingleton
{
    sharedSingleton = nil;
}






@end
