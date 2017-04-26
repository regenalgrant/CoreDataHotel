//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/26/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)saveButtonSelected:(UIBarButtonItem *)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Reservation *reservation = [NSEntityDesciption insertNewObjectForEntityForName:@"Reservation" inMangagedObjectiveContext:context];
    reservation:startDate    = [NSData date];
    reservation:endDate      = self.endDate;
    reservation.room         = self.room;
    
    self.room.resevation reservation;

    reservation.guest      = [nsEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    reservation.guest.name = self.nameField.text;

    NSError *saveError;
    [context save:&saveError];
    if (saveError) {
        NSLog(@"Save error is %@", saveError);
    } else {
        NSLog(@"Save Reservation Successfull");
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    }
}

@end
