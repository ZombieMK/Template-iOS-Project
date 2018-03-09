//
//  Macros.h
//  Template iOS project
//
//  Created by Jovan Samardziski on 3/8/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// Removing mas_ prefix from Masonary
#define MAS_SHORTHAND

// Global Variables
#define screenBounds                        [[UIScreen mainScreen] bounds]
#define screenHeight                        [[UIScreen mainScreen] bounds].size.height
#define screenWidth                         [[UIScreen mainScreen] bounds].size.width
#define userDefaults                        [NSUserDefaults standardUserDefaults]
#define notificationCenter                  [NSNotificationCenter defaultCenter]
#define localizedString(string)             NSLocalizedString(string, nil)

// Null Checks
#define nullCheckString(string)             string = ([string isEqual:[NSNull null]] || string == nil) ? @"" : string
#define nullCheckNSNumber(number)           number = ([number isEqual:[NSNull null]] || number == nil) ? @(-1) : number

#endif /* Macros_h */
