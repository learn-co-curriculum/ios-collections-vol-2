//
//  FISCollections2Spec.m
//  Collections2
//
//  Created by Chris Gonzales on 5/31/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCollections2.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISCollections2)

describe(@"FISCollections2", ^{
    __block FISCollections2 *collection;
    __block NSArray *keys;
    __block NSArray *data;
    __block NSArray *mergedData;
    __block NSArray *cool;
    __block NSDictionary *schools;
    __block NSDictionary *organizedSchools;
    
    beforeAll(^{
        collection = [[FISCollections2 alloc] init];
        keys = @[
                 @{
                     @"first_name":  @"blake"
                     },
                 @{
                     @"first_name":  @"ashley"
                     }
                 ];
        data = @[
                @{
                    @"blake": @{
                            @"awesomeness": @10,
                            @"height": @74,
                            @"last_name": @"johnson"
                            },
                    @"ashley": @{
                            @"awesomeness": @9,
                            @"height": @60,
                            @"last_name": @"dubs"
                            }
                    }
                ];
        mergedData = @[
                       @{
                           @"first_name": @"blake",
                           @"awesomeness": @10,
                           @"height": @74,
                           @"last_name": @"johnson"
                           },
                       @{
                           @"first_name": @"ashley",
                           @"awesomeness": @9,
                           @"height": @60,
                           @"last_name": @"dubs"
                           }
                       ];
        cool = @[
                 @{
                     @"name": @"ashley",
                     @"temperature": @"sort of cool"
                     },
                 @{
                     @"name": @"blake",
                     @"temperature": @"cool"
                     }
                 ];
        
        schools = @{
                    @"flatiron school bk": @{
                            @"location": @"NYC"
                            },
                    @"flatiron school": @{
                            @"location": @"NYC"
                            },
                    @"dev boot camp": @{
                            @"location": @"SF"
                            },
                    @"dev boot camp chicago": @{
                            @"location": @"Chicago"
                            },
                    @"general assembly": @{
                            @"location": @"NYC"
                            },
                    @"Hack Reactor": @{
                            @"location": @"SF"
                            }
                    };
        
        organizedSchools = @{@"NYC":@[@"flatiron school bk",@"flatiron school",@"general assembly"],
                             @"SF":@[@"dev boot camp",@"Hack Reactor"],
                             @"Chicago":@[@"dev boot camp chicago"]};
        
    });
    
    describe(@"beginsWithC", ^{
        it(@"returns true if every element of the tools array starts with 'c' and returns false otherwise",^{
            BOOL result = [collection beginsWithC:@[@"cocoapods", @"core data", @"cocoa touch"]];
            expect(result).to.equal(YES);
        });
        
        it(@"returns false if there's an element that does not begin with 'c'",^{
            BOOL result = [collection beginsWithC:@[@"cocoapods", @"core data", @"brocoa touch"]];
            expect(result).to.equal(NO);
        });
    });
    
    describe(@"containsA", ^{
        it(@"returns all elements that contain the letter 'a'",^{
            NSArray *result = [collection containA:@[@"earth", @"fire", @"wind", @"water", @"heart"]];
            expect(result).to.beSupersetOf(@[@"earth", @"water", @"heart"]);
        });
    });
    
    describe(@"firstWa", ^{
        it(@"return the first element that begins with the letters 'wa'",^{
            NSString *firstWa = [collection firstWa:@[@"candy", @"pepper", @"wall", @"ball", @"wacky"]];
            expect(firstWa).to.equal(@"wall");
        });
    });
    
    describe(@"removeNonStrings", ^{
        it(@"remove everything that's not an string from an array",^{
            NSArray *result = [collection removeNonStrings:@[@"blake", @1, @{@"hello": @"ey"}]];
            expect(result).to.equal(@[@"blake"]);
        });
    });
    
    describe(@"countElements", ^{
        it(@"count how many times something appears in an array",^{
            NSArray *result = [collection countElements:@[@{@"name": @"blake"}, @{@"name": @"blake"},  @{@"name": @"ashley"}]];
            expect(result).to.equal(@[@{@"name": @"blake", @"count": @2}, @{@"name": @"ashley", @"count": @1}]);
        });
    });
        
    describe(@"mergeData", ^{
        it(@"take 2 arrays containing dictionaries, and return an array containing 2 dictionaries of merged data",^{
            NSArray  *result = [collection mergeDataWithKeys:keys AndData:data];
            expect(result).to.equal(mergedData);
        });
    });
    
    describe(@"findCool", ^{
        it(@"find all the cool dictionaries",^{
            expect([collection findCool:cool]).to.equal(@[@{@"name": @"blake", @"temperature": @"cool"}]);
        });
    });
    
    describe(@"organizeSchools", ^{
        it(@"take a dictionary of schools with their respective locations and return a dictionary where the keys are locations and each value is an array of the schools in that location",^{
            expect([collection organizeSchools:schools]).to.equal(organizedSchools);
        });
    });
});

SpecEnd
