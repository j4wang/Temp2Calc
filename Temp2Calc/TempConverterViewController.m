//
//  TempConverterViewController.m
//  Temp2Calc
//
//  Created by John on 10/5/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celciusTextField;
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UILabel *kelvinText;

- (void)convertCelcius;
- (void)convertFahrenheit;
- (void)updateCelciusValues;
- (void)updateFahrenheitValues;
@end

@implementation TempConverterViewController

const float FAHRENHEIT_OFFSET = 32;
const float FAHRENHEIT_MULTIPLE = 1.8;
const float KELVIN_OFFSET = 273.15;
const NSString* CONVERT_CELCIUS = @"celcius";
const NSString* CONVERT_FAHRENHEIT = @"fahrenheit";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"John's Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.celciusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate functions

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    SEL fieldSelector = nil;
    if ([textField isEqual:_celciusTextField]) {
        //fieldSelector = @selector(onDoneButton:CONVERT_CELCIUS);
        fieldSelector = @selector(convertCelcius);
        NSLog(@"celcius!");
    } else if ([textField isEqual:_fahrenheitTextField]) {
        fieldSelector = @selector(convertFahrenheit);
        NSLog(@"fahrenheit!");
    } else {
        fieldSelector = @selector(convertCelcius);
        NSLog(@"not sure, default to celcius!");
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:fieldSelector];
    
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    
    
    return YES;
}

#pragma mark - Private functions
- (void)convertCelcius {
    [self.view endEditing:YES];
    
    [self updateCelciusValues];

}

- (void)convertFahrenheit {
    [self.view endEditing:YES];
    
    [self updateFahrenheitValues];
    
}

- (void)updateCelciusValues {
    float celciusTemp = [self.celciusTextField.text floatValue];
    
    // write values back in labels
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", (FAHRENHEIT_MULTIPLE * celciusTemp) + FAHRENHEIT_OFFSET];
    self.kelvinText.text = [NSString stringWithFormat:@"%0.2f", celciusTemp + KELVIN_OFFSET];
}

- (void)updateFahrenheitValues {
    float fahrenheitTemp = [self.fahrenheitTextField.text floatValue];
    float celciusTemp = (fahrenheitTemp - FAHRENHEIT_OFFSET)/FAHRENHEIT_MULTIPLE;
    
    // write values back in labels
    self.celciusTextField.text = [NSString stringWithFormat:@"%0.2f", celciusTemp];
    self.kelvinText.text = [NSString stringWithFormat:@"%0.2f", celciusTemp + KELVIN_OFFSET];
}
@end
