//
//  AppDelegate.m
//  osx
//
//  Created by Klaas Pieter Annema on 28-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "AppDelegate.h"

#import "MainWindowController.h"

@interface AppDelegate ()
@property (nonatomic, readwrite, strong) NSWindowController *mainWindowController;
@end
@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
    [self.mainWindowController showWindow:self];
}

@end
