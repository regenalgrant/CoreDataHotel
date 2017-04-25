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
#import "RoomsViewController.h"


@interface HotelsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray     *allHotels;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Hotel *selectedHotel;




@end

@implementation HotelsViewController

{
    NSArray *_allHotels;
}

-(void)loadView
{
    [super loadView];
    // TODO: Programatically create a UITableView
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds
                                                 style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate         = self;
    self.tableView.dataSource       = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

-(NSArray *)allHotels
{
    if (!_allHotels)
    {
        AppDelegate *appDelegate        = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        NSFetchRequest *request         = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        NSError *fetchError;
        NSArray *hotels                 = [context executeFetchRequest: request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching hotels from Core Data!");
            
        }
        _allHotels                      = hotels;
    }
    return _allHotels;
    
}


#pragma mark: UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RoomsViewController *roomVC     = [[RoomsViewController alloc] init];
    roomVC.selectedHotel            = self.allHotels[indexPath.row];
    [self.navigationController pushViewController:roomVC animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Hotel *hotel                    = self.allHotels[indexPath.row];
    cell.textLabel.text             = hotel.name;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //or self.allHotels//
    return [self.allHotels count];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"Rooms"])
    {
        [self.tableView reloadData];
    }
}






@end
