//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject

+(NSArray *)fullScreenContraintsWithVFLForView:(UIView *)view;

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute
                              andMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)genericContraintFrom:(UIView *)view
                                     toView:(UIView *)superView
                              withAttribute:(NSLayoutAttribute)attribute;


+(NSLayoutConstraint *)equalHeightConstraintFrom:(UIView *)view
                                          toView:(UIView *)otherView
                                  withMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView;

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView;

+ (NSLayoutConstraint *)topConstraintFrom:(UIView *)view
                                   toView:(UIView *)otherView;

+ (NSLayoutConstraint *)bottomConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView;

+ (NSLayoutConstraint *)height:(CGFloat)height
                       forView:(UIView *)view;

+ (NSLayoutConstraint *)width:(CGFloat)width
                      forView:(UIView *)view;

+ (NSLayoutConstraint *)centerYFrom:(UIView *)view
                             toView:(UIView *)otherView
                         withOffset:(CGFloat)offset;

+ (NSLayoutConstraint *)centerXFrom:(UIView *)view
                             toView:(UIView *)otherView
                         withOffset:(CGFloat)offset;


+(NSLayoutConstraint *)topOffset:(CGFloat)offset
                        fromView:(id)view
                          toView:(id)otherView;

+(NSLayoutConstraint *)genericContraintFrom:(id)view
                              withAttribute:(NSLayoutAttribute)thisAttribute
                                     toView:(id)otherView
                              withAttribute:(NSLayoutAttribute)otherAttribute
                              andMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)topOffset:(CGFloat)offset
                     fromViewTop:(id)view
                    toViewBottom:(id)otherView;
+ (NSLayoutConstraint *)offset:(CGFloat)offset
                forThisItemTop:(id)item
                 toThatItemTop:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
                forThisItemTop:(id)item
              toThatItemBottom:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
             forThisItemBottom:(id)item
              toThatItemBottom:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
             forThisItemBottom:(id)item
                 toThatItemTop:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
            forThisItemLeading:(id)item
             toThatItemLeading:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
            forThisItemLeading:(id)item
            toThatItemTrailing:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
           forThisItemTrailing:(id)item
            toThatItemTrailing:(id)otherItem;

+ (NSLayoutConstraint *)offset:(CGFloat)offset
           forThisItemTrailing:(id)item
             toThatItemLeading:(id)otherItem;
@end
