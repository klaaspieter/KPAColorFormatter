//
//  MainWindowController.m
//  osx
//
//  Created by Klaas Pieter Annema on 28-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "MainWindowController.h"

@implementation MainWindowController

- (void)showWindow:(id)sender;
{
    [super showWindow:sender];
    NSColorPanel *colorPanel = [NSColorPanel sharedColorPanel];
    colorPanel.target = self;
    colorPanel.action = @selector(changeColor:);
    [colorPanel orderFront:self];
}

- (void)changeColor:(id)sender;
{
    NSColorPanel *colorPanel = (NSColorPanel *)sender;
    self.rgbLabel.objectValue = colorPanel.color;
    self.nameLabel.objectValue = colorPanel.color;
}

@end
