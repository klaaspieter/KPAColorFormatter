//
//  KPAColorFormatter.m
//  KPAColorFormatter
//
//  Created by Klaas Pieter Annema on 22-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "KPAColorFormatter.h"

@implementation KPAColorFormatter

- (id)initWithColors:(NSDictionary *)colors;
{
    self = [super init];
    if (self) {
        _colors = colors;
    }

    return self;
}

- (NSString *)stringForObjectValue:(id)value;
{
    if (![value isKindOfClass:[UIColor class]]) {
        return nil;
    }

    NSString *name = [self.colors objectForKey:value];
    if (!name) {
        name = [self.colors objectForKey:[self colorClosestToColor:value]];
    }

    return name;
}

- (UIColor *)colorClosestToColor:(UIColor *)color;
{
    CGFloat red1, green1, blue1;
    [color getRed:&red1 green:&green1 blue:&blue1 alpha:nil];

    __block CGFloat closestDelta = CGFLOAT_MAX;
    __block UIColor *closestColor = nil;
    [[self.colors allKeys] enumerateObjectsUsingBlock:^(UIColor *possibleColor, NSUInteger idx, BOOL *stop) {
        CGFloat red2, green2, blue2;
        [possibleColor getRed:&red2 green:&green2 blue:&blue2 alpha:nil];
        CGFloat deltaR = pow(red2 - red1, 2);
        CGFloat deltaG = pow(green2 - green1, 2);
        CGFloat deltaB = pow(blue2 - blue1, 2);
        CGFloat delta = deltaR + deltaG + deltaB;
        if (delta < closestDelta) {
            closestDelta = delta;
            closestColor = possibleColor;
        }
    }];

    return closestColor;
}

- (BOOL)getObjectValue:(out __autoreleasing id *)obj forString:(NSString *)string errorDescription:(out NSString *__autoreleasing *)error;
{
    __block UIColor *matchingColor = nil;
    [self.colors enumerateKeysAndObjectsUsingBlock:^(UIColor *color, NSString *name, BOOL *stop) {
        if([name isEqualToString:string]) {
            matchingColor = color;
            *stop = YES;
        }
    }];

    if (matchingColor) {
        *obj = matchingColor;
        return YES;
    } else {
        *error = [NSString stringWithFormat:@"No known color for name: %@", string];
        return NO;
    }
}

@end