//
//  ReservationCell.h
//  CoreDataHotel
//
//  Created by regenal grant on 4/29/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reservation+CoreDataClass.h"


@interface ReservationCell : UITableViewCell

@property (strong, nonatomic) Reservation *reservation;

@end
