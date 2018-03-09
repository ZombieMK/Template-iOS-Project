//
//  Utilities.m
//  Template iOS project
//
//  Created by Jovan Samardziski on 3/8/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "Utilities.h"
#import "AFNetworking.h"
#import <sys/utsname.h>

@implementation Utilities

// MARK: Alerts
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dissmissAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"ok", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:dissmissAction];
    [controller presentViewController:alertController animated:true completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller onDismiss:(Dismiss)dismiss {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dissmissAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"ok", nil) style:UIAlertActionStyleDefault handler:dismiss];
    [alertController addAction:dissmissAction];
    [controller presentViewController:alertController animated:true completion:nil];
}

+ (void)showOKCancelAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller onDismiss:(Dismiss)dismiss onConfirmation:(Confirmation)confirmation {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmationAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:confirmation];
    [alertController addAction:confirmationAction];
    
    UIAlertAction *dissmissAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:dismiss];
    [alertController addAction:dissmissAction];
    
    [controller presentViewController:alertController animated:true completion:nil];
}

+ (void)showActionSheetInController:(id)controller title:(NSString *)title message:(NSString *)message titles:(NSArray<NSString *> *)titles handlers:(NSArray<AlertActionHandler> *)handlers {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Actions
    for (NSInteger i = 0; i < titles.count; i++) {
        NSString *title = [titles objectAtIndex:i];
        id handler = [handlers objectAtIndex:i];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
        [alertController addAction:action];
    }
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    
    [controller presentViewController:alertController animated:true completion:nil];
}

// MARK: Color
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

// MARK: Border
+ (void)addBorderToSubviewsOfView:(UIView *)view {
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0) return;
    
    for (UIView *subview in subviews) {
        subview.layer.borderColor = [UIColor redColor].CGColor;
        subview.layer.borderWidth = 2;
        [self addBorderToSubviewsOfView:subview];
    }
}

// MARK: Subviews
+ (void)removeAllSubviewsFromView:(UIView *)view {
    NSArray *subviews = [view subviews];
    
    for (UIView *subview in subviews) {
        [self removeAllSubviewsRecursively:subview];
    }
}

+ (void)removeAllSubviewsRecursively:(UIView *)view {
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0) [view removeFromSuperview];
    
    for (UIView *subview in subviews) {
        [self removeAllSubviewsRecursively:subview];
    }
}

// MARK: UIImageView
+ (void)imageViewWithSwappedColor:(UIImageView *)theImageView andColor:(UIColor *)theColor {
    theImageView.image = [theImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [theImageView setTintColor:theColor];
}

// MARK: Downloading
+ (void)downloadImage:(NSString *)image :(void (^)(BOOL success, UIImage *image, NSError *error))completitionBlock {
    if (image != nil && (NSNull *)image != [NSNull null] && image.length > 0) {
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(concurrentQueue, ^{
            NSString *urlString = image;
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    error = [self serializeErrorResponseForError:error];
                    if (completitionBlock) completitionBlock(false, nil, error);
                    
                    NSLog(@"Error downloading image from url: %@. Error: %@", image, error);
                } else if (data) {
                    UIImage *image = [UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (completitionBlock) completitionBlock(true, image, nil);
                    });
                }
            }];
            [task resume];
        });
    } else {
        NSLog(@"DownloadImage: The URL is nil.");
    }
}

// MARK: Error Serialization
+ (NSError *)serializeErrorResponseForError:(NSError *)error {
    NSString *messageString = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    
    NSData *data = [messageString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSDictionary *message = json;
    
    NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
    if (message) [userInfo setObject:message forKey:@"error_message"];
    
    return [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
}

// MARK: Size calculations
+ (CGFloat)getHeightFromTheHeight:(CGFloat)height {
    return screenHeight * (height / 667);
}

+ (CGFloat)getWidthFromTheWidth:(CGFloat)width {
    return screenWidth * (width / 375);
}

// MARK: Check if iPhone X
+ (BOOL)isIphoneX {
    static BOOL isiPhoneX = NO;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
#if TARGET_IPHONE_SIMULATOR
        NSString *model = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#else
        
        struct utsname systemInfo;
        uname(&systemInfo);
        
        NSString *model = [NSString stringWithCString:systemInfo.machine
                                             encoding:NSUTF8StringEncoding];
#endif
        isiPhoneX = [model isEqualToString:@"iPhone10,3"] || [model isEqualToString:@"iPhone10,6"];
    });
    
    return isiPhoneX;
}

@end
