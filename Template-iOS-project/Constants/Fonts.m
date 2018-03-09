//
//  Fonts.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "Fonts.h"

@implementation Fonts

// MARK: OpenSans
+ (UIFont *)fontOpenSansRegularWithSize:(CGFloat)size {
    if ([Utilities isIphoneX]) {
        return [UIFont fontWithName:@"OpenSans" size:[Utilities getHeightFromTheHeight:size * 0.8]];
    } else {
        return [UIFont fontWithName:@"OpenSans" size:[Utilities getHeightFromTheHeight:size]];
    }
}

+ (UIFont *)fontOpenSansBoldWithSize:(CGFloat)size {
    if ([Utilities isIphoneX]) {
        return [UIFont fontWithName:@"OpenSans-Bold" size:[Utilities getHeightFromTheHeight:size * 0.8]];
    } else {
        return [UIFont fontWithName:@"OpenSans-Bold" size:[Utilities getHeightFromTheHeight:size]];
    }
}

+ (UIFont *)fontOpenSansLightWithSize:(CGFloat)size {
    if ([Utilities isIphoneX]) {
        return [UIFont fontWithName:@"OpenSans-Light" size:[Utilities getHeightFromTheHeight:size * 0.8]];
    } else {
        return [UIFont fontWithName:@"OpenSans-Light" size:[Utilities getHeightFromTheHeight:size]];
    }
}

+ (UIFont *)fontOpenSansSemiboldWithSize:(CGFloat)size {
    if ([Utilities isIphoneX]) {
        return [UIFont fontWithName:@"OpenSans-Semibold" size:[Utilities getHeightFromTheHeight:size * 0.8]];
    } else {
        return [UIFont fontWithName:@"OpenSans-Semibold" size:[Utilities getHeightFromTheHeight:size]];
    }
}

@end
