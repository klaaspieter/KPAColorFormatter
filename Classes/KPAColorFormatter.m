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

    return [self.colors objectForKey:value];
}

@end