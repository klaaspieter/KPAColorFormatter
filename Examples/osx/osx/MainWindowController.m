//
//  MainWindowController.m
//  osx
//
//  Created by Klaas Pieter Annema on 28-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "MainWindowController.h"

#import "KPAColorFormatter.h"

@implementation MainWindowController

- (void)showWindow:(id)sender;
{
    [super showWindow:sender];
    NSColorPanel *colorPanel = [NSColorPanel sharedColorPanel];
    colorPanel.target = self;
    colorPanel.action = @selector(changeColor:);
    [colorPanel orderFront:self];

    [self.languagePopup removeAllItems];
    NSMenuItem *englishItem = [[NSMenuItem alloc] initWithTitle:@"English" action:nil keyEquivalent:@""];
    englishItem.representedObject = @"en-US";
    [self.languagePopup.menu addItem:englishItem];

    NSMenuItem *dutchItem = [[NSMenuItem alloc] initWithTitle:@"Nederlands" action:nil keyEquivalent:@""];
    dutchItem.representedObject = @"nl-NL";
    [self.languagePopup.menu addItem:dutchItem];
}

- (void)changeColor:(id)sender;
{
    NSColorPanel *colorPanel = (NSColorPanel *)sender;
    self.rgbLabel.objectValue = colorPanel.color;
    self.nameLabel.objectValue = colorPanel.color;
}

- (IBAction)changeLanguage:(id)sender;
{
    NSString *localeIdentifier = self.languagePopup.selectedItem.representedObject;
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    KPAColorFormatter *formatter = (KPAColorFormatter *)self.nameLabel.formatter;
    formatter.locale = locale;

    // Force reformatting
    self.nameLabel.objectValue = self.nameLabel.objectValue;
}

@end
