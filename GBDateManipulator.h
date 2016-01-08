//
//  GBDateManipulator.h
//  gobbeasy
//
//  Created by Matteo Gobbi on 12/10/12.
//  Copyright (c) 2012 Matteo Gobbi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBDateManipulator : NSObject

+ (NSString *)differenceFeedbackFromDate:(NSDate *)date1 andDate:(NSDate *)date2;
+ (NSString *)getStringToLocaleDate:(NSDate *)date;
+ (int)getCurrentTimestamp;

@end
