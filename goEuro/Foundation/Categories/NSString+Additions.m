//
//  NSString+Additions.m
//  SWPlatform
//
//  Created by Irfan Bashir on 5/8/12.
//  Copyright (c) 2012 UCS Solutions. All rights reserved.
//

#import "NSString+Additions.h"
#import "SWDefaults.h"
#include <CommonCrypto/CommonDigest.h>



#define NUMERIC                 @"1234567890"
@implementation NSString (Additions)


- (NSString *)currencyString {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    
    double value = 0.2f;
    
    BOOL returnValue  = [scanner scanDouble:&value];
    
    if (returnValue) {
        return [NSString currencyStringWithDouble:value];
    } else {
        return [NSString currencyStringWithDouble:0.0f];
    }
}





+ (NSString *)currencyStringWithDouble:(double)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setMaximumFractionDigits:2];

    
    return [formatter stringFromNumber:[NSNumber numberWithDouble:value]];
}
+ (NSString *)createGuid {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuidStringRef];
    CFRelease(uuidStringRef);
    return uuid;
}

- (NSString *)sentenceCapitalizedString
{
    if (![self length])
    {
        return [NSString string];
    }
    NSString *uppercase = [[self substringToIndex:1] uppercaseString];
    NSString *lowercase = [[self substringFromIndex:1] lowercaseString];
    return [uppercase stringByAppendingString:lowercase];
}

- (NSString *)realSentenceCapitalizedString {
    __weak NSMutableString *mutableSelf = [NSMutableString stringWithString:self];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationBySentences
                          usingBlock:^(NSString *sentence, NSRange sentenceRange, NSRange enclosingRange, BOOL *stop) {
                              [mutableSelf replaceCharactersInRange:sentenceRange withString:[sentence sentenceCapitalizedString]];
                          }];
    return [NSString stringWithString:mutableSelf]; // or just return mutableSelf.
}


+ (BOOL)isOnlyNumericValues:(NSString *)value
{
    NSCharacterSet *unacceptedInput = nil;
    unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:NUMERIC] invertedSet];
    if ([[value componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1)
    {
        return YES;
    }
    return NO;
}
+ (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+ (NSString *)shaString:(NSString*)input;
{
    NSString *hashkey = input;
//    // PHP uses ASCII encoding, not UTF
//    const char *s = [hashkey cStringUsingEncoding:NSASCIIStringEncoding];
//    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
//    
//    // This is the destination
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH] = {0};
//    // This one function does an unkeyed SHA1 hash of your hash data
//    CC_SHA1(keyData.bytes, keyData.length, digest);
//    
//    // Now convert to NSData structure to make it usable again
//    NSData *out = [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
//    // description converts to hex but puts <> around it and spaces every 4 bytes
//    NSString *hash = [out description];
//    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
//    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
//    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
//    [hash uppercaseString];
    return hashkey;
}

+ (NSString *)currentVersion
{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    
    return  [infoDict objectForKey:@"CFBundleShortVersionString"];
}

@end




//@implementation  UITextField (UITextFieldCode)
//@synthesize code;
//@end


