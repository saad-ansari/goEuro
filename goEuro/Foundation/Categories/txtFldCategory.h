//
//  txtFldCategory.h
//  ScrollView
//
//  Created by Saqib Khan on 12/26/13.
//  Copyright (c) 2013 Saqib Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UITextField (txtFldExtended)

@property (nonatomic, retain) id objectCode;
@property (nonatomic, assign) int objectRow;

@end

@interface UITextField_MaxLength : UITextField<UITextFieldDelegate>

@property (nonatomic)IBInspectable int textMaxLength;
@end
