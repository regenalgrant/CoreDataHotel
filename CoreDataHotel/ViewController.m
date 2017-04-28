//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

@import Crashlytics;



#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"
#import "DatePickerViewController.h"
#import "LookUpRerservationController.h"


@interface ViewController ()


@end

@implementation ViewController



-(void)loadView{
    [super loadView];
    [self setUpLayout];
    self.view.backgroundColor        = [UIColor whiteColor];


}

-(void)setUpLayout
{
    CGFloat topLayoutHeight      = CGRectGetHeight(self.navigationController.navigationBar.frame) + 20;
    CGFloat buttonHeight         = (self.view.bounds.size.height - topLayoutHeight) / 3;

    UIButton *browseButton       = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton         = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton       = [self createButtonWithTitle:@"Look Up"];

    bookButton.backgroundColor   = [UIColor redColor];
    browseButton.backgroundColor = [UIColor blueColor];
    lookupButton.backgroundColor = [UIColor yellowColor];

    [AutoLayout leadingConstraintFrom:browseButton
                               toView:self.view];

    [AutoLayout trailingConstraintFrom:browseButton
                                toView:self.view];

    [AutoLayout equalHeightConstraintFrom:browseButton
                                   toView:bookButton
                           withMultiplier:1.0];

    [AutoLayout genericContraintFrom:browseButton
                       withAttribute:NSLayoutAttributeTop
                              toView:self.topLayoutGuide
                       withAttribute:NSLayoutAttributeBottom
                       andMultiplier:1.0];

    [AutoLayout genericContraintFrom:browseButton
                       withAttribute:NSLayoutAttributeBottom
                              toView:bookButton
                       withAttribute:NSLayoutAttributeTop
                       andMultiplier:1.0];


    [AutoLayout leadingConstraintFrom:bookButton
                               toView:self.view];

    [AutoLayout trailingConstraintFrom:bookButton
                                toView:self.view];

    [AutoLayout genericContraintFrom:bookButton
                       withAttribute:NSLayoutAttributeBottom
                              toView:lookupButton
                       withAttribute:NSLayoutAttributeTop
                       andMultiplier:1.0];

    [AutoLayout leadingConstraintFrom:lookupButton
                               toView:self.view];

    [AutoLayout trailingConstraintFrom:lookupButton
                                toView:self.view];
    [AutoLayout equalHeightConstraintFrom:lookupButton
                                   toView:bookButton withMultiplier:1.0];

    [AutoLayout genericContraintFrom:lookupButton
                       withAttribute:NSLayoutAttributeBottom
                              toView:self.view
                       withAttribute:NSLayoutAttributeBottom
                       andMultiplier:1.0];

    //NSLayoutConstraint *browseHeight = [AutoLayout equalHeightConstraintFrom:browseButton toView:self.view withMultiplier:0.33];



    [browseButton addTarget:self
                     action:@selector(browseButtonSelected)
           forControlEvents:UIControlEventTouchUpInside];

    [bookButton addTarget:self
                   action:@selector(bookButtonSelected)
         forControlEvents:UIControlEventTouchUpInside];

    [lookupButton addTarget:self
                     action:@selector(lookupButtonSelected)
           forControlEvents:UIControlEventTouchUpInside];
}

-(void)browseButtonSelected
{
    [Answers logCustomEventWithName:@"ViewController - Browse Button Pressed" customAttributes:nil];
    HotelsViewController *hotelVC = [[HotelsViewController alloc]init];
    
    [self.navigationController pushViewController:hotelVC
                                         animated:YES];
    //    NSLog(@"Work on this for lab!");
    
}
-(void)bookButtonSelected
{
        [Answers logCustomEventWithName:@"ViewController - Book Button Pressed" customAttributes:nil];
    DatePickerViewController *datePickerController = [[DatePickerViewController alloc] init];
    
    [self.navigationController pushViewController:datePickerController
                                         animated:YES];
}
    
-(void)lookupButtonSelected
{
    LookUpRerservationController *lookUpReservationController = [[LookUpRerservationController alloc] init];
    
    [self.navigationController pushViewController:lookUpReservationController
                                         animated:YES];
}

-(UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    
    return button;


}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
