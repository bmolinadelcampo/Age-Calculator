//
//  ViewController.m
//  Age Calaculator
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *birthdateLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (strong, nonatomic) NSDate *birthdate;
@property NSInteger age;

- (IBAction)calculateAge:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd MMM, yyyy"];
    self.currentDateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.ageLabel.text = @"";
}

- (void)sendBirthdateBack:(NSString *)birthdateString
{
    self.birthdateLabel.text = birthdateString;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SetBirthdateViewController *destination = segue.destinationViewController;
    destination.delegate = self;
    
    if (!(self.birthdateLabel.text.length == 0)) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"dd MMM, yyyy"];
        destination.birthdate = [dateFormatter dateFromString:self.birthdateLabel.text];
    }
}

- (IBAction)calculateAge:(id)sender {
    
    if (!(self.birthdateLabel.text.length == 0)) {

        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSUInteger unitFlag = NSCalendarUnitYear;
        
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"dd MMM, yyyy"];
        NSDate *birthdate = [dateFormatter dateFromString:self.birthdateLabel.text];
        
        NSDateComponents *components = [gregorian components:unitFlag
                                                    fromDate:birthdate
                                                      toDate:[NSDate date] options:0];
        self.age = [components year];
        self.ageLabel.text = [NSString stringWithFormat:@"%d years old", (int)self.age];
    }
}
@end
