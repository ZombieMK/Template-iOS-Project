//
//  Utilities.h
//  Template iOS project
//
//  Created by Jovan Samardziski on 3/8/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utilities : NSObject

// MARK: Blocks
typedef void(^Dismiss)(UIAlertAction *action);
typedef void(^Confirmation)(UIAlertAction *action);
typedef void(^CameraCaptureCompleton)(UIAlertAction *action);
typedef void(^CameraRollCompletion)(UIAlertAction *action);
typedef void(^Discard)(UIAlertAction *action);
typedef void(^AlertActionHandler)(UIAlertAction *action);
typedef void(^Success)(id response);
typedef void(^Failure)(NSDictionary *error);

// MARK: Alerts
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller onDismiss:(Dismiss)dismiss;
+ (void)showOKCancelAlertWithTitle:(NSString *)title message:(NSString *)message inController:(id)controller onDismiss:(Dismiss)dismiss onConfirmation:(Confirmation)confirmation;
+ (void)showActionSheetInController:(id)controller title:(NSString *)title message:(NSString *)message titles:(NSArray<NSString *> *)titles handlers:(NSArray<AlertActionHandler> *)handlers;

// MARK: Color
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

// MARK: Border
+ (void)addBorderToSubviewsOfView:(UIView *)view;

// MARK: Subviews
+ (void)removeAllSubviewsFromView:(UIView *)view;

// MARK: UIImageView
+ (void)imageViewWithSwappedColor:(UIImageView *)theImageView andColor:(UIColor *)theColor;

// MARK: Downloading
+ (void)downloadImage:(NSString *)image :(void (^)(BOOL success, UIImage *image, NSError *error))completitionBlock;

// MARK: Error Serialization
+ (NSError *)serializeErrorResponseForError:(NSError *)error;

// MARK: Size calculations
+ (CGFloat)getHeightFromTheHeight:(CGFloat)height;
+ (CGFloat)getWidthFromTheWidth:(CGFloat)width;

// MARK: Check if iPhone X
+ (BOOL)isIphoneX;

@end
