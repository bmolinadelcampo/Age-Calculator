//
//  SetBirthdateViewController.m
//  Age Calaculator
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "SetBirthdateViewController.h"

@interface SetBirthdateViewController ()

- (IBAction)setBirthdateWithDatePicker:(id)sender;
@end

@implementation SetBirthdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.birthdate) {
        self.datePicker.date = self.birthdate;
    }
}

- (IBAction)setBirthdateWithDatePicker:(id)sender {
    
    self.datePicker.maximumDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateFormat:@"dd MMM, yyyy"];
    self.birthdateString = [dateFormatter stringFromDate:self.datePicker.date];
    NSLog(@"%@", self.birthdateString);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.delegate sendBirthdateBack:self.birthdateString];
}
@end
