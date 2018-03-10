//
//  NetworkService.h
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkService : NSObject

// MARK: Blocks
typedef void(^Success)(id response);
typedef void(^Failure)(NSDictionary *error);

// MARK: Singelton Methods
+ (id)sharedService;

// MARK: Template requests
+ (void)templateGetRequestWithParamterOne:(NSString *)parameterOne andParameterTwo:(NSString *)parameterTwo completionBlock:(Success)successBlock faliureBlock:(Failure)failureBlock;
+ (void)templatePostRequestWithParamterOne:(NSString *)parameterOne andParameterTwo:(NSString *)parameterTwo completionBlock:(Success)successBlock faliureBlock:(Failure)failureBlock;

@end
