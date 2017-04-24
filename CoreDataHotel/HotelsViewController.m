//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"


@interface HotelsViewController () <UITableViewDataSource>

@property(strong, nonatomic) NSArray *allHotels;
@property(strong, nonatomic) UITableView *tableView;



@end

@implementation HotelsViewController

-(void)loadView{
    [super loadView];
    // TODO: Programatically create a UITableView
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(NSArray *)allHotels{
    if (!_allHotels) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotels"];
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest: request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching hotels from Core Data!");
            
        }
        _allHotels = hotels;
    }
    return _allHotels;
    
}


#pragma mark: UITableViewDeleagate





@end
