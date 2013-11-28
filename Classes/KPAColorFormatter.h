//
//  KPAColorFormatter.h
//  KPAColorFormatter
//
//  Created by Klaas Pieter Annema on 22-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

@interface KPAColorFormatter : NSFormatter

@property (nonatomic, readwrite, strong) NSLocale *locale;

@property (nonatomic, readwrite, copy) NSDictionary *colors;

- (id)initWithColors:(NSDictionary *)colors;

@end
