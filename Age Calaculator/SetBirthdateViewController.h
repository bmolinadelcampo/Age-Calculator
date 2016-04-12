//
//  SetBirthdateViewController.h
//  Age Calaculator
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendBirthdateBack <NSObject>

- (void)sendBirthdateBack:(NSString *)birthdateString;

@end

@interface SetBirthdateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) NSString *birthdateString;
@property (strong, nonatomic) NSDate *birthdate;
@property (weak, nonatomic) id <SendBirthdateBack> delegate;

@end
