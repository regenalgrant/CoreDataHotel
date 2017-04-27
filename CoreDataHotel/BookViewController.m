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
@property(strong, nonatomic) UITextField   *nameField;
@end

@implementation BookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    AppDelegate *appDelegate                                 = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context                          = appDelegate.persistentContainer.viewContext;

    Reservation *reservation                                 = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    reservation.startDate                                    = self.startDate;
    reservation.endDate                                      = self.endDate;
    reservation.room                                         = self.room;

    reservation.guest                                        = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
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


@end
