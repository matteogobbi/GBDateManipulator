//
//  GBDateManipulator.m
//  gobbeasy
//
//  Created by Matteo Gobbi on 12/10/12.
//  Copyright (c) 2012 Matteo Gobbi. All rights reserved.
//

#import "GBDateManipulator.h"

@implementation GBDateManipulator

/* Get a localized date and time from NSDate */
+ (NSString *)getStringToLocaleDate:(NSDate *) date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [NSLocale currentLocale];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"dd/MM/yyyy-HH:mm:ss"];
    
    NSString *dateString = [dateFormatter stringFromDate: date];
    
    return dateString;
}


/* Return a feedback string that rappresent the differece from date1 and date2 */
+ (NSString *)differenceFeedbackFromDate:(NSDate *)date1 andDate:(NSDate *)date2 {
    
    double ti = [date1 timeIntervalSinceDate:date2];
    ti = ti * -1;
    
    if (ti < 60) {
        
        return [NSString stringWithFormat:@"%ds", (int)ti];
    } else if (ti < 3600) {
        int diff = round(ti / 60);
        
        return [NSString stringWithFormat:@"%dm", diff];
    } else if (ti < 86400) {
        int diff = round(ti / 60 / 60);
        
        return [NSString stringWithFormat:@"%dh", diff];
    } else {
        int diff = round(ti / 60 / 60 / 24);
        
        //Return years
        if(diff >= 365) {
            int y = round(diff/365.0);
            if(y > 100) return [NSString stringWithFormat:@"+%dy", y];
            return [NSString stringWithFormat:@"%dy", y];
        }
        
        //Return day
        return [NSString stringWithFormat:@"%dd", diff];
    }
}


/* Get actual timestamp (int) */
+ (int)getActualTimestamp {
    return [[NSDate date] timeIntervalSince1970];
}

@end
