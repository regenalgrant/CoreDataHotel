//
//  AutoLayout.m
//  CoreDataHotel
//
//  Created by Regenal Grant on 4/24/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout

+ (NSArray *)fullScreenConstraintWithVFLForView:(UIView *)view
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSDictionary *dict = @{@"view": view};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:dict];
    [constraints addObjectsFromArray:horizontalConstraints];
    [constraints addObjectsFromArray:verticalConstraints];
    
    [NSLayoutConstraint activateConstraints:constraints]; // Need to activate them in order to work
    
    return [constraints copy];
}

+ (NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                       toView:(UIView *)superView
                                withAttribute:(NSLayoutAttribute)attribute
{
    return [AutoLayout genericConstraintFrom:view toView:superView withAttribute:attribute andMultiplier:1];
}

+ (NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                       toView:(UIView *)superView
                                withAttribute:(NSLayoutAttribute)attribute
                                andMultiplier:(CGFloat)multiplier
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:attribute
                                                                 multiplier:multiplier
                                                                   constant:0.0];
    
    constraint.active = YES;
    return constraint;
}

+ (NSLayoutConstraint *)equalHeightConstraintFromView:(UIView *)view
                                               toView:(UIView *)otherView
                                       withMultiplier:(CGFloat)multiplier
{
    NSLayoutConstraint *heightConstraint = [AutoLayout genericConstraintFrom:view
                                                                      toView:otherView
                                                               withAttribute:NSLayoutAttributeHeight
                                                               andMultiplier:multiplier];
    
    return heightConstraint;
}

+ (NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView
{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeLeading];
}

+ (NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                        toView:(UIView *)otherView
{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeTrailing];
}

+ (NSLayoutConstraint *)topConstraintFrom:(UIView *)view
                                   toView:(UIView *)otherView
{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeTop];
}

+ (NSLayoutConstraint *)bottomConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView
{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeBottom];
}


+ (NSLayoutConstraint *)centerXFrom:(UIView *)view
                             toView:(UIView *)otherView
                         withOffset:(CGFloat)offset
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)centerYFrom:(UIView *)view
                             toView:(UIView *)otherView
                         withOffset:(CGFloat)offset
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)height:(CGFloat)height
                       forView:(UIView *)view
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:height];
    constraint.active = YES;
    return constraint;
}

+ (NSLayoutConstraint *)width:(CGFloat)width
                      forView:(UIView *)view
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:width];
    constraint.active = YES;
    return constraint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
                forThisItemTop:(id)item
                 toThatItemTop:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
                forThisItemTop:(id)item
              toThatItemBottom:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
             forThisItemBottom:(id)item
              toThatItemBottom:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
             forThisItemBottom:(id)item
                 toThatItemTop:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}


+ (NSLayoutConstraint *)offset:(CGFloat)offset
            forThisItemLeading:(id)item
             toThatItemLeading:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
            forThisItemLeading:(id)item
            toThatItemTrailing:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
           forThisItemTrailing:(id)item
            toThatItemTrailing:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}

+ (NSLayoutConstraint *)offset:(CGFloat)offset
           forThisItemTrailing:(id)item
             toThatItemLeading:(id)otherItem
{
    NSLayoutConstraint *constaint = [NSLayoutConstraint constraintWithItem:item
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:otherItem
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:offset];
    constaint.active = YES;
    return constaint;
}


@end
