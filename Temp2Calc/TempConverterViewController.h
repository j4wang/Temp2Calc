//
//  TempConverterViewController.h
//  Temp2Calc
//
//  Created by John on 10/5/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempConverterViewController : UIViewController <UITextFieldDelegate>

extern const float FAHRENHEIT_OFFSET;
extern const float FAHRENHEIT_MULTIPLE;
extern const float KELVIN_OFFSET;
extern const NSString* CONVERT_CELCIUS;
extern const NSString* CONVERT_FAHRENHEIT;

@end
