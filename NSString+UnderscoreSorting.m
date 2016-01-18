//
//  NSString+UnderscoreSorting.m
//  
//
//  Created by Pavel Dolgov on 18/01/16.
//  Copyright © 2016 Pavel Dolgov. All rights reserved.
//

#import "NSString+UnderscoreSorting.h"

@implementation NSString (UnderscoreSorting)

- (NSComparisonResult)caseInsensitiveCompareUnderscoresGoFisrt:(NSString *)string
{
    NSUInteger numberOfLeadingUnderscoresInFirstString = [self countLeadingUnderscores:self];
    NSUInteger numberOfLeadingUnderscoresInSecondString = [self countLeadingUnderscores:string];
    
    if (numberOfLeadingUnderscoresInFirstString < numberOfLeadingUnderscoresInSecondString) return NSOrderedDescending;
    if (numberOfLeadingUnderscoresInFirstString > numberOfLeadingUnderscoresInSecondString) return NSOrderedAscending;
    
    return [self caseInsensitiveCompare:string];
}

- (NSUInteger)countLeadingUnderscores:(NSString *)string
{
    NSUInteger result;
    for (result = 0; result < [string length]; ++result)
    {
        unichar character = [string characterAtIndex:result];
        if (character != '_')
        {
            return result;
        }
    }
    return [string length];
}

@end
