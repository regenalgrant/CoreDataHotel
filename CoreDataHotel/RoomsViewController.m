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

@interface RoomsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *rooms;

@end

@implementation RoomsViewController

- (void)loadView
{
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds
                                                 style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;

    self.rooms                = [[self.selectedHotel rooms]allObjects];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
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
