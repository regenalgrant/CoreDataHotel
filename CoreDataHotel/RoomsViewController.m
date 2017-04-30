//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "RoomsViewController.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "AutoLayout.h"

@interface RoomsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *rooms;
@property (strong, nonatomic)NSMutableArray *roomNumbers;

@end

@implementation RoomsViewController

- (void)loadView
{
    [super loadView];
    self.navigationItem.title = @"Rooms";
    
    [self.view addSubview:self.tableView];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.roomNumbers = [[NSMutableArray alloc] init];
    self.rooms = [[self.selectedHotel rooms] allObjects];
    for (Room *room in self.rooms) {
        [self.roomNumbers addObject:[NSNumber numberWithUnsignedInteger:room.number]];
    }
    self.roomNumbers = [[self.roomNumbers sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [AutoLayout fullScreenContraintsWithVFLForView:self.view];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell     = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Room *room                = self.rooms[indexPath.row];
    cell.textLabel.text       = [[NSNumber numberWithUnsignedInteger:room.number]stringValue];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rooms count];
}




@end
