//
//  NSString+Additions.h
//  SWPlatform
//
//  Created by Irfan Bashir on 5/8/12.
//  Copyright (c) 2012 UCS Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

- (NSString *)currencyString;
- (NSString *)sentenceCapitalizedString; // sentence == entire string
- (NSString *)realSentenceCapitalizedString; // sentence == real sentences
+ (NSString *)createGuid;
+ (NSString *)currencyStringWithDouble:(double)value;
+ (BOOL)isOnlyNumericValues:(NSString *)value;
+ (BOOL)validateEmailWithString:(NSString*)email;
+ (NSString *)shaString:(NSString*)input;
+ (NSString *)currentVersion;
@end


//@interface UITextField (UITextFieldCode)
//@property(nonatomic,strong)NSString *code;
//@end
