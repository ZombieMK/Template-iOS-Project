//
//  NetworkService.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "NetworkService.h"
#import "NetworkClient.h"

@implementation NetworkService

// MARK: Singelton Methods

+ (id)sharedService {
    static NetworkService *service = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        service = [self new];
    });
    
    return service;
}

// MARK: Template requests

+ (void)templateGetRequestWithParamterOne:(NSString *)parameterOne andParameterTwo:(NSString *)parameterTwo completionBlock:(Success)successBlock faliureBlock:(Failure)failureBlock {
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([Utilities stringCheck:parameterOne]) [params setObject:parameterOne forKey:apiKeyParameterOne];
    if ([Utilities stringCheck:parameterTwo]) [params setObject:parameterTwo forKey:apiKeyParameterTwo];
    
    AFHTTPSessionManager *manager = [NetworkClient sharedClientAuthenticated];
    
    [manager GET:urlTemplateGet parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *err = [Utilities serializeErrorResponseForError:error];
        NSDictionary *result = [[[err userInfo] objectForKey:dictKeyErrorMessage] objectForKey:dictKeyError];
        
        failureBlock(result);
    }];
}

+ (void)templatePostRequestWithParamterOne:(NSString *)parameterOne andParameterTwo:(NSString *)parameterTwo completionBlock:(Success)successBlock faliureBlock:(Failure)failureBlock {
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([Utilities stringCheck:parameterOne]) [params setObject:parameterOne forKey:apiKeyParameterOne];
    if ([Utilities stringCheck:parameterTwo]) [params setObject:parameterTwo forKey:apiKeyParameterTwo];
    
    AFHTTPSessionManager *manager = [NetworkClient sharedClientAuthenticated];
    
    [manager POST:urlTemplateGet parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *err = [Utilities serializeErrorResponseForError:error];
        NSDictionary *result = [[[err userInfo] objectForKey:dictKeyErrorMessage] objectForKey:dictKeyError];
        
        failureBlock(result);
    }];
}

@end
