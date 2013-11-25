//
//  KPAColorFormatter.h
//  KPAColorFormatter
//
//  Created by Klaas Pieter Annema on 22-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPAColorFormatter : NSFormatter

@property (nonatomic, readwrite, copy) NSDictionary *colors;

- (id)initWithColors:(NSDictionary *)colors;

@end
