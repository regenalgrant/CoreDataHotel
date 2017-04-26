//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute
                              andMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute;

+(NSArray *)fullScreenContraintsWithVFLForView:(UIView *)view;

+(NSLayoutConstraint *)equalHeightConstraintFrom:(UIView *)view
                                          toView:(UIView *)otherView
                                  withMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView;

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView;

+(NSLayoutConstraint *)height:(CGFloat)height
forView:(UIView *)view;

+(NSLayoutConstraint *)topOffset:(CGFloat)offset
                        fromView:(UIView *)view
                          toView:(UIView *)otherView;


@end
