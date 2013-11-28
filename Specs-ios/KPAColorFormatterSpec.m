#import "SpecHelper.h"

#import "KPAColorFormatter.h"

SpecBegin(KPAColorFormatter)

__block KPAColorFormatter *_formatter;

describe(@"KPAColorFormatter", ^{
    before(^{
        _formatter = [[KPAColorFormatter alloc] initWithColors:@{
            [UIColor redColor]: @"Red",
            [UIColor greenColor]: @"Green",
            [UIColor blueColor]: @"Blue"
        }];
    });

    it(@"has default colors", ^{
        _formatter = [[KPAColorFormatter alloc] init];
        expect(_formatter.colors).toNot.beEmpty();
    });

    it(@"uses the current locale by default", ^{
        expect(_formatter.locale).to.equal([NSLocale currentLocale]);
    });

    it(@"has a convenience method", ^{
        NSString *expected = [_formatter stringForObjectValue:[UIColor greenColor]];
        expect([KPAColorFormatter localizedStringFromColor:[UIColor greenColor]]).to.equal(expected);
    });

    it(@"only formats UIColor", ^{
        expect([_formatter stringForObjectValue:[[NSObject alloc] init]]).to.beNil();
    });

    it(@"can name exact color matches", ^{
        expect([_formatter stringForObjectValue:[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]]).to.equal(@"Blue");
    });

    it(@"can find the closest color match", ^{
        expect([_formatter stringForObjectValue:[UIColor colorWithRed:0.9 green:0.5 blue:0.5 alpha:1.0]]).to.equal(@"Red");
    });

    it(@"can format known color names into UIColor instances", ^{
        UIColor *color = nil;
        NSString *error = nil;
        BOOL didSucceed = [_formatter getObjectValue:&color forString:@"Blue" errorDescription:&error];
        expect(didSucceed).to.beTruthy();
        expect(color).to.equal([UIColor blueColor]);
        expect(error).to.beNil();
    });

    it(@"returns an error by reference if no color can be found for the name", ^{
        UIColor *color = nil;
        NSString *error = nil;
        BOOL didSucceed = [_formatter getObjectValue:&color forString:@"Space Gray" errorDescription:&error];
        expect(didSucceed).to.beFalsy();
        expect(color).to.beNil();
        expect(error).toNot.beEmpty();
    });

    it(@"doesn't attempt to set the error if none is given", ^{
        // Will crash with EXC_BAD_ACCESS on failure
        UIColor *color = nil;
        [_formatter getObjectValue:&color forString:@"Space Gray" errorDescription:nil];
    });

    it(@"can format colors using a different locale", ^{
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:@"nl-NL"];
        expect([_formatter stringForObjectValue:[UIColor blueColor]]).to.equal(@"Blauw");
    });

    it(@"can format colors to attributed strings", ^{
        NSAttributedString *attributedString = [_formatter attributedStringForObjectValue:[UIColor redColor] withDefaultAttributes:nil];
        expect([attributedString attributesAtIndex:0 effectiveRange:NULL]).to.contain(@{NSForegroundColorAttributeName: [UIColor redColor]});
    });

    it(@"retains the default attributes when formatting to attributed strings", ^{
        NSAttributedString *attributedString = [_formatter attributedStringForObjectValue:[UIColor redColor] withDefaultAttributes:@{NSBackgroundColorAttributeName: [UIColor blackColor]}];
        expect([attributedString attributesAtIndex:0 effectiveRange:NULL]).to.contain(@{NSBackgroundColorAttributeName: [UIColor blackColor]});
    });
});

SpecEnd
