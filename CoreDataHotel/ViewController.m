//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"


@interface ViewController ()

@end

@implementation ViewController



-(void)loadView{
    [super loadView];
    [self setUpLayout];
    self.view.backgroundColor        = [UIColor whiteColor];

}

-(void)setUpLayout{

    UIButton *browseButton           = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton             = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton           = [self createButtonWithTitle:@"Look Up"];

    browseButton.backgroundColor     = [UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0];

    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstraintFrom:browseButton toView:self.view];

    NSLayoutConstraint *browseHeight = [AutoLayout equalHeightConstraintFrom:browseButton toView:self.view withMultiplier:0.33];



    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];

}
-(void)browseButtonSelected{
    HotelsViewController *hotelVC    = [[HotelsViewController alloc]init];
    [self.navigationController pushViewController:hotelVC animated:YES];
    //    NSLog(@"Work on this for lab!");


}
-(UIButton *)createButtonWithTitle:(NSString *)title{
    UIButton *button                 = [[UIButton alloc]init];

    [button setTitle:title forState:UIControlStateNormal];

    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [button setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.view addSubview:button];

    return button;


}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
