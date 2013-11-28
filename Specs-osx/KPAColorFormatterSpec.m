#import "SpecHelper.h"

#import "KPAColorFormatter.h"

SpecBegin(KPAColorFormatter)

__block KPAColorFormatter *_formatter;

describe(@"KPAColorFormatter", ^{
    before(^{
        _formatter = [[KPAColorFormatter alloc] initWithColors:@{
                                                                 [NSColor redColor]: @"Red",
                                                                 [NSColor greenColor]: @"Green",
                                                                 [NSColor blueColor]: @"Blue"
                                                                 }];
    });

    it(@"has default colors", ^{
        _formatter = [[KPAColorFormatter alloc] init];
        expect(_formatter.colors).toNot.beEmpty();
    });

    it(@"uses the current locale by default", ^{
        expect(_formatter.locale).to.equal([NSLocale currentLocale]);
    });

    it(@"only formats UIColor", ^{
        expect([_formatter stringForObjectValue:[[NSObject alloc] init]]).to.beNil();
    });

    it(@"can name exact color matches", ^{
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en-US"];
        expect([_formatter stringForObjectValue:[NSColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]]).to.equal(@"Blue");
    });

    it(@"can find the closest color match", ^{
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en-US"];
        expect([_formatter stringForObjectValue:[NSColor colorWithRed:0.9 green:0.5 blue:0.5 alpha:1.0]]).to.equal(@"Red");
    });

    it(@"can format known color names into UIColor instances", ^{
        NSColor *color = nil;
        NSString *error = nil;
        BOOL didSucceed = [_formatter getObjectValue:&color forString:@"Blue" errorDescription:&error];
        expect(didSucceed).to.beTruthy();
        expect(color).to.equal([NSColor blueColor]);
        expect(error).to.beNil();
    });

    it(@"returns an error by reference if no color can be found for the name", ^{
        NSColor *color = nil;
        NSString *error = nil;
        BOOL didSucceed = [_formatter getObjectValue:&color forString:@"Space Gray" errorDescription:&error];
        expect(didSucceed).to.beFalsy();
        expect(color).to.beNil();
        expect(error).toNot.beEmpty();
    });

    it(@"doesn't attempt to set the error if none is given", ^{
        // Will crash with EXC_BAD_ACCESS on failure
        NSColor *color = nil;
        [_formatter getObjectValue:&color forString:@"Space Gray" errorDescription:nil];
    });
    
    it(@"can format colors using a different locale", ^{
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:@"nl-NL"];
        expect([_formatter stringForObjectValue:[NSColor blueColor]]).to.equal(@"Blauw");
    });
});

SpecEnd
