//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/25/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"

@interface DatePickerViewController ()

@property(strong, nonatomic) UIDatePicker *endDate;

@end

@implementation DatePickerViewController


-(void)loadView
{
    [super loadView];

    [self setupDatePickers];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}
-(void)setupDoneButton
{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(doneButtonPressed)];

    [self.navigationItem setRightBarButtonItem:doneButton];
}

-(void)doneButtonPressed
{
    NSDate *startDate = self.startDate.date;
    NSDate *endDate   = self.endDate.date;
    //check date is correct//
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate])
    self.endDate.date = [NSDate date];
    return;
}
AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc] init];
availabilityController.endDate = endDate;
availabilityController.startDate = startDate;
[self.navigationController pushViewController:availabilityController animated: YES];


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)setupDatePickers
{
    self.endDate                = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;

    self.endDate.frame          = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    
    [self.view addSubview:self.endDate];

}

@end







