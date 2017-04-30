//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/26/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "BookViewController.h"
#import "AppDelegate.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "CoreDataHotel+CoreDataModel.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "AutoLayout.h"



@interface BookViewController ()

@property(strong, nonatomic) UITextField *nameField;
@property(strong, nonatomic) UITextField *firstName;
@property(strong, nonatomic) UITextField *lastName;
@property(strong, nonatomic) UITextField *emailAddress;
@end

@implementation BookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)guestInfo
{
    self.firstName = [[UITextField alloc]init];
    self.firstName.placeholder = @"First Name";
    self.firstName.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat navAndStatusBarHeight                            = CGRectGetHeight(self.navigationController.navigationBar.frame) + 20.0;
    
    NSLayoutConstraint *top                                  = [AutoLayout genericContraintFrom:self.firstName
                                                                                         toView:self.view
                                                                                  withAttribute: NSLayoutAttributeTop];

    top.constant                                             = navAndStatusBarHeight + 20;
    
    NSLayoutConstraint *leading                              = [AutoLayout leadingConstraintFrom:self.firstName
                                                                                          toView:self.view];
    leading.constant                                         = 20;
    
    NSLayoutConstraint *trailing                             = [AutoLayout trailingConstraintFrom:self.firstName
                                                                                           toView:self.view];
    trailing.constant                                        = -20;
    
    [self.firstName becomeFirstResponder];
    
    
 }
-(void)setNameField
{
    self.nameField                                           = [[UITextField alloc] init];
    self.nameField.placeholder                               = @"Please Enter Your Name...";
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.nameField];

    CGFloat navAndStatusBarHeight                            = CGRectGetHeight(self.navigationController.navigationBar.frame) + 20.0;

    NSLayoutConstraint *top                                  = [AutoLayout genericContraintFrom:self.nameField
                                                                                         toView:self.view
                                                                                  withAttribute: NSLayoutAttributeTop];

    top.constant                                             = navAndStatusBarHeight + 20;

    NSLayoutConstraint *leading                              = [AutoLayout leadingConstraintFrom:self.nameField
                                                                                          toView:self.view];
    leading.constant                                         = 20;

    NSLayoutConstraint *trailing                             = [AutoLayout trailingConstraintFrom:self.nameField
                                                                                           toView:self.view];
    trailing.constant                                        = -20;

    [self.nameField becomeFirstResponder];
}


-(void)saveButtonSelected:(UIBarButtonItem *)sender
{
    AppDelegate *appDelegate        = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;

    Reservation *reservation        = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation"
                 inManagedObjectContext:context];
    
    reservation.startDate           = self.startDate;
    reservation.endDate             = self.endDate;
    reservation.room                = self.room;
    reservation.guest               = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    reservation.guest.name                                   = self.nameField.text;

    NSError *saveError;
    [context save:&saveError];
    if (saveError)
{
        NSLog(@"Save error is %@", saveError);
    } else
{
        NSLog(@"Save Reservation Successfull");

        [self.navigationController popToRootViewControllerAnimated:YES];
}
}
-(void)setupTextFields
{
    UITextField *firstName    = [[UITextField alloc] init];
    UITextField *lastName     = [[UITextField alloc] init];
    UITextField *emailAddress = [[UITextField alloc] init];

    [firstName setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lastName setTranslatesAutoresizingMaskIntoConstraints:NO];
    [emailAddress setTranslatesAutoresizingMaskIntoConstraints:NO];

    firstName.placeholder     = @"First Name";
    lastName.placeholder      = @"Last Name";
    emailAddress.placeholder  = @"Email Address";

    [AutoLayout height:30 forView:firstName];
    [AutoLayout height:30 forView:lastName];
    [AutoLayout height:30 forView:emailAddress];
    
    
    
    
    
    

}
@end
