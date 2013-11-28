//
//  MainWindowController.h
//  osx
//
//  Created by Klaas Pieter Annema on 28-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController
@property (weak, nonatomic) IBOutlet NSTextField *rgbLabel;
@property (weak, nonatomic) IBOutlet NSTextField *nameLabel;
@end
