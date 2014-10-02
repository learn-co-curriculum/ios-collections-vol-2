//
//  FISCollections2.m
//  Collections2
//
//  Created by Chris Gonzales on 5/31/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections2.h"

@implementation FISCollections2

-(BOOL)beginsWithC:(NSArray *)array
{
    
    NSPredicate *cPredicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'c'"];
    NSArray *cWords = [array filteredArrayUsingPredicate:cPredicate];
    return [cWords count] == [array count];
}

-(NSArray *)containA:(NSArray *)array
{
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] 'a'"];
    return [array filteredArrayUsingPredicate:aPredicate];
}

-(NSString *)firstWa:(NSArray *)array
{
    NSPredicate *waPredicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", @"wa"];
    NSArray *waArray = [array filteredArrayUsingPredicate:waPredicate];
    
    return [waArray firstObject];
}

-(NSArray *)removeNonStrings:(NSArray *)array
{
    NSPredicate *nonStringPredicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSString class]];
    return [array filteredArrayUsingPredicate:nonStringPredicate];
}

-(NSArray *)countElements:(NSArray *)array
{
    NSMutableDictionary *countDict = [[NSMutableDictionary alloc] init];
    for (NSMutableDictionary *element in array) {
        if (countDict[element]) {
            NSInteger count = [countDict[element] integerValue];
            count++;
            countDict[element] = [NSNumber numberWithInteger:count];
        } else {
            countDict[element] = @1;
        }
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *key in [countDict allKeys]) {
        NSMutableDictionary *mutableKey = [key mutableCopy];
        mutableKey[@"count"] = countDict[key];
        [resultArray addObject:mutableKey];
    }
    return resultArray;
}

-(NSArray *)mergeDataWithKeys:(NSArray *)keys AndData:(NSArray *)data
{
    NSMutableArray *container = [[NSMutableArray alloc] init];
    
    for (NSDictionary *personName in keys) {
        NSString *name = personName[@"first_name"];
        
        for (NSDictionary *personData in data) {
            if (personData[name]) {
                NSMutableDictionary *mergedPerson = [personData[name] mutableCopy];
                mergedPerson[@"first_name"] = name;
                [container addObject:mergedPerson];
            }
        }
    }
    return container;
}

-(NSArray *)findCool:(NSArray *)array
{
    NSMutableArray *container = [[NSMutableArray alloc] init];
    for (NSDictionary *person in array) {
        if ([person[@"temperature"] isEqual:@"cool"]) {
            [container addObject:person];
        }
    }
    return container;
}

-(NSDictionary *)organizeSchools:(NSDictionary *)schools
{
    NSMutableDictionary *organizedSchools = [[NSMutableDictionary alloc] init];
    for (NSString *schoolName in [schools allKeys]) {
        NSDictionary *locationDictionary = schools[schoolName];
        NSString *location = locationDictionary[@"location"];
        
        if (organizedSchools[location]) {
            [organizedSchools[location] addObject:schoolName];
        } else {
            organizedSchools[location] = [[NSMutableArray alloc] initWithObjects:schoolName, nil];
        }
    }
    return organizedSchools;
};

@end
