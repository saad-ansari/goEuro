//
//  txtFldCategory.m
//  ScrollView
//
//  Created by Saqib Khan on 12/26/13.
//  Copyright (c) 2013 Saqib Khan. All rights reserved.
//

#import "txtFldCategory.h"
#import <objc/runtime.h>

static char const * const ObjectCodeKey = "ObjectTag";
static char const * const ObjectRowKey = "ObjectRow";

@implementation UITextField (txtFldExtended)

@dynamic objectCode;
@dynamic objectRow;

- (id)objectCode {
    return objc_getAssociatedObject(self, ObjectCodeKey);
}

- (void)setObjectCode:(id)newObjectCode {
    objc_setAssociatedObject(self, ObjectCodeKey, newObjectCode, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)objectRow {
    return (int)objc_getAssociatedObject(self, ObjectRowKey);
}

- (void)setObjectRow:(int)newObjectCode
{
    id var = [NSNumber numberWithInteger: newObjectCode];

    objc_setAssociatedObject(self, ObjectRowKey, var, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@interface UITextField_MaxLength()

@property (nonatomic, assign) id <UITextFieldDelegate> superDelegate;

@end

@implementation UITextField_MaxLength

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //validate the length, only if it's set to a non zero value
    if (self.textMaxLength>0) {
        if(range.length + range.location > textField.text.length)
            return NO;
        
        if (textField.text.length+string.length - range.length>self.textMaxLength) {
            return NO;
        }
    }
    
    //if length validation was passed, query the super class to see if the delegate method is implemented there
    if (self.superDelegate && [self.superDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.superDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    else{
        //if the super class does not implement the delegate method, simply return YES as the length validation was passed
        return YES;
    }
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    if (delegate == self)
        return;
    self.superDelegate = delegate;
    [super setDelegate:self];
}

//forward all non overriden delegate methods
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.superDelegate  respondsToSelector:aSelector])
        return self.superDelegate;
    
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.superDelegate respondsToSelector:aSelector])
        return YES;
    
    return [super respondsToSelector:aSelector];
}
@end

/*
By specifying OBJC_ASSOCIATION_RETAIN_NONATOMIC, we tell the runtime to retain the value for us. Other possible values are OBJC_ASSOCIATION_ASSIGN, OBJC_ASSOCIATION_COPY_NONATOMIC, OBJC_ASSOCIATION_RETAIN, OBJC_ASSOCIATION_COPY, corresponding to the familiar property declaration attributes.
*/





