//
//  NSString+UnderscoreSorting.h
//  
//
//  Created by Pavel Dolgov on 18/01/16.
//  Copyright © 2016 Pavel Dolgov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UnderscoreSorting)

- (NSComparisonResult)caseInsensitiveCompareUnderscoresGoFisrt:(NSString *)string;

@end
