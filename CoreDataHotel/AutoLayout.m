//
//  AutoLayout.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute
                              andMultiplier:(CGFloat)multiplier{
    NSLayoutConstraint *constraints      = [NSLayoutConstraint constraintWithItem:view
                                                                        attribute:attribute
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:superView
                                                                        attribute:attribute
                                                                       multiplier:multiplier
                                                                         constant:0.0];
    constraints.active                   = YES;

    return constraints;
}

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute{
    return [AutoLayout genericContraintFrom:view toView:superView withAttribute:attribute andMultiplier:1.0];

}

+(NSArray *)fullScreenContraintsWithVFLForView:(UIView *)view{
    NSMutableArray *constraints          = [[NSMutableArray alloc]init];

    NSDictionary *viewDictionary         = @{@"view": view};

    NSArray *horizontalContraints        = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:viewDictionary];

    NSArray *verticalContraints          = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:viewDictionary];

    [constraints addObjectsFromArray:horizontalContraints];
    [constraints addObjectsFromArray:verticalContraints];

    [NSLayoutConstraint activateConstraints:constraints];

    return constraints.copy;
}

+(NSLayoutConstraint *)equalHeightConstraintFrom:(UIView *)view
                                          toView:(UIView *)otherView
                                  withMultiplier:(CGFloat)multiplier{

    NSLayoutConstraint *heightConstraint = [AutoLayout genericContraintFrom:view toView:otherView withAttribute:NSLayoutAttributeHeight andMultiplier:multiplier];

    return heightConstraint;
}

+(NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView{
    return [AutoLayout genericContraintFrom:view toView:otherView withAttribute:NSLayoutAttributeLeading];
}

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView{
    return [AutoLayout genericContraintFrom:view toView:otherView withAttribute:NSLayoutAttributeTrailing];

}




@end
