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
});

SpecEnd
