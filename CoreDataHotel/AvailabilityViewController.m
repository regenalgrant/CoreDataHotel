//
//  AvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/25/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "AutoLayout.h"
#import "AppDelegate.h"
#import "BookViewController.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface AvailabilityViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSFetchedResultsController *availableRooms;




@end

@implementation AvailabilityViewController

-(NSFetchedResultsController *)availabilityRooms
{
    
    if (!_availableRooms)
    {
        AppDelegate *appDelegate                                 = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request                                  = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        
        request.predicate                                        = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@", self.endDate, self.startDate, [NSDate date]];
        
        NSError *roomError;
        NSArray *results                                         = [appDelegate.persistentContainer.viewContext executeFetchRequest:request
                                                                                                                              error:&roomError];
        
        NSMutableArray *unavailableRooms                         = [NSMutableArray new];
        
        for(Reservation *reservation in results)
        {
            [unavailableRooms addObject:reservation];
            
        }
        
        NSFetchRequest *roomRequest            = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        roomRequest.predicate                  = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];

        NSSortDescriptor *roomSortDescriptor   = [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
        NSSortDescriptor *roomNumberDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];

        roomRequest.sortDescriptors            = @[roomSortDescriptor];

        _availableRooms                        = [[NSFetchedResultsController alloc] initWithFetchRequest:roomRequest
                                                              managedObjectContext:appDelegate.persistentContainer.viewContext
                                                                sectionNameKeyPath: @"hotel"
                                                                         cacheName:nil];
    }
    return _availableRooms;
}

-(void)loadView
{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpTableView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)setUpTableView
{
    self.tableView                                           = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource                                = self;
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"cell"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [AutoLayout fullScreenContraintsWithVFLForView:self.tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo              = [[self.availableRooms sections]objectAtIndex:section];
    
    //    return self.availableRooms.count;
    return sectionInfo.numberOfObjects;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell                                    = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                                                               forIndexPath:indexPath];

    Room *currentRoom                                        = [self.availableRooms objectAtIndexPath:indexPath];
    
    cell.textLabel.text                                      = [NSString stringWithFormat:@"Room: %i (%i beds, $%0.2f per night)", currentRoom.number, currentRoom.beds, currentRoom.rate];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Room *room                                               = [self.availableRooms objectAtIndexPath:indexPath];
    
    BookViewController *bookViewController                   = [[BookViewController alloc] init];
    bookViewController.room                                  = room;
    bookViewController.endDate                               = self.endDate;
    
    [self.navigationController pushViewController:bookViewController animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.availableRooms.sections.count;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo              = [self.availableRooms.sections objectAtIndex:section];
    
    return sectionInfo.name;
}



    
    
    
    
    
@end
