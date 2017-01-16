//
//  NSDictionary+Additions.m
//  SWFoundation
//
//  Created by Irfan Bashir on 6/27/12.
//  Copyright (c) 2012 UCS Solutions. All rights reserved.
//

#import "NSDictionary+Additions.h"
#import "NSString+Additions.h"
@implementation NSDictionary (Additions)

- (NSString *)currencyStringForKey:(id)key {
    NSString *value = [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    if (!value) {
        value = @"0.0";
    }
    
    return [value currencyString];
}

- (NSString *)stringForKey:(id)key {
    NSString *value = @"";
    if ([self objectForKey:key]) {
        value = [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    } else {
        value = @"";
    }
    return value;
}

- (NSString *)dateStringForKey:(id)key withDateFormat:(NSDateFormatterStyle)format {
    NSString *dateString = [self stringForKey:key];
    
    if (dateString.length > 0) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        //[dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [dateFormatter setLocale:usLocale];
        NSDate *dateFromString = [dateFormatter dateFromString:dateString];
        
        if (!dateFromString && [[self objectForKey:key] isKindOfClass:[NSDate class]]) {
            dateFromString = (NSDate *)[self objectForKey:key];
        }
        
        [dateFormatter setDateFormat:nil];
        [dateFormatter setDateStyle:format];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        
        dateString = [dateFormatter stringFromDate:dateFromString];
        dateFormatter=nil;
        usLocale=nil;
    }
    
    return dateString;
}



@end


@implementation UIImage (Additions)

+(UIImage *)imageNamed:(NSString *)name cache:(BOOL)cache
{
    if (cache)
        return [UIImage imageNamed:name];
    name = [[NSBundle mainBundle] pathForResource:[name stringByDeletingPathExtension] ofType:[name pathExtension]];
    UIImage *retVal = [[UIImage  alloc] initWithContentsOfFile:name];
    return retVal;
}

@end

//// UIPopoverController+iPhone.m file
//@implementation UIPopoverController (iPhone)
////+ (BOOL)_popoversDisabled {
////    return NO;
////}
//@end
