//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/26/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic) Room *room;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;



@end
