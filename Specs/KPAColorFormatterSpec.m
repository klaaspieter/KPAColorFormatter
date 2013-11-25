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
        BOOL didSucceed = [_formatter getObjectValue:&color forString:@"Blue" errorDescription:nil];
        expect(didSucceed).to.beTruthy();
        expect(color).to.equal([UIColor blueColor]);
    });
});

SpecEnd
