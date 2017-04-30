//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/25/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"
#import "AutoLayout.h"


@interface DatePickerViewController ()

@property(strong, nonatomic) UIDatePicker *endDate;
@property(strong, nonatomic) UIDatePicker *startDate;
@property(strong, nonatomic) UILabel *startDateLabel;
@property(strong, nonatomic) UILabel *endDateLabel;


@end

@implementation DatePickerViewController


-(void)loadView
{
    [super loadView];
    [self setupDoneButton];
    [self setupDatePickers];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}


-(void)setupDoneButton
{
    UIBarButtonItem *doneButton                        = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(doneButtonPressed)];

    [self.navigationItem setRightBarButtonItem:doneButton];
}



-(void) setupLabel
{
    

    UILabel *startDateLabel        = [[UILabel alloc] init];
    UILabel *endDateLabel          = [[UILabel alloc] init];

    [self.startDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.endDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

    startDateLabel.text            = @"Start Date";
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.textAlignment   = NSTextAlignmentCenter;
    startDateLabel.textColor       = [UIColor whiteColor];
    startDateLabel.numberOfLines   = 0;

    endDateLabel.text              = @"End Date";
    endDateLabel.backgroundColor   = [UIColor clearColor];
    endDateLabel.textAlignment     = NSTextAlignmentCenter;
    endDateLabel.textColor         = [UIColor whiteColor];
    endDateLabel.numberOfLines     = 0;



    [self.view addSubview:self.startDateLabel];
    [self.view addSubview:self.endDateLabel];

}

-(void)setupDatePickers
{
    self.startDate  =[[UIDatePicker alloc]init];
    self.startDate.datePickerMode                      = UIDatePickerModeDate;

    self.startDateLabel.backgroundColor = [UIColor greenColor];

    self.endDate                                       = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode                        = UIDatePickerModeDate;


    self.startDate.backgroundColor = [UIColor redColor];
    self.endDate.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.startDate];
    [self.view addSubview:self.endDate];
    

    
    [self.startDate setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.endDate setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // layout
    [AutoLayout leadingConstraintFrom:self.startDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.startDate toView:self.view];
    [AutoLayout leadingConstraintFrom:self.endDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.endDate toView:self.view];
    
    [AutoLayout equalHeightConstraintFrom:self.startDate toView:self.endDate withMultiplier:1.0];
    [AutoLayout topOffset:30 fromViewTop:self.startDate toViewBottom:self.topLayoutGuide];
    
   // [AutoLayout offset:0 fromViewBottom:self.endDate toViewBottom:self.view];
   // [AutoLayout offset:-30 fromViewBottom:self.startDate toViewTop:self.endDate];
    
}

//check date is correct//


-(void)doneButtonPressed
{
    NSDate *startDate                                  = self.startDate.date;
    NSDate *endDate                                    = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]){
        self.endDate.date                                  = [NSDate date];
        return;
        
    }
    
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc] init];
    availabilityController.endDate                     = endDate;
    availabilityController.startDate                   = startDate;
    [self.navigationController pushViewController:availabilityController animated: YES];
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [startDate timeIntervalSinceReferenceDate])
    {
        self.startDate.date                                = [NSDate date];
        return;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

@end







