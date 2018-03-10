//
//  NetworkClient.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "NetworkClient.h"

@implementation NetworkClient

+ (NetworkClient *)sharedClient {
    static NetworkClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", @"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sharedClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_sharedClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_sharedClient.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"cache-control"];
    });
    return _sharedClient;
}

+ (NetworkClient *)sharedClientAuthenticated {
    static NetworkClient *_sharedClientAuthenticated = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClientAuthenticated = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        
        _sharedClientAuthenticated.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        _sharedClientAuthenticated.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", @"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
        _sharedClientAuthenticated.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sharedClientAuthenticated.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_sharedClientAuthenticated.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_sharedClientAuthenticated.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"cache-control"];
    });
    
    NSString *token = [userDefaults objectForKey:apiKeyAuth];
    NSString *theTokenData = [NSString stringWithFormat:@"Bearer %@", token];
    
    // Authentication
    [_sharedClientAuthenticated.requestSerializer setValue:theTokenData forHTTPHeaderField:@"Authorization"];
    
    return _sharedClientAuthenticated;
}

+ (NetworkClient *)sharedClientAuthenticatedMultipart {
    static NetworkClient *_sharedClientAuthenticatedMultipart = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClientAuthenticatedMultipart = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        
        _sharedClientAuthenticatedMultipart.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        _sharedClientAuthenticatedMultipart.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", @"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
        _sharedClientAuthenticatedMultipart.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sharedClientAuthenticatedMultipart.requestSerializer setValue:@"multipart/form-data; boundary=8de940a6-ad40-44f8-a240-48a573c1a6e7" forHTTPHeaderField:@"Content-Type"];
        [_sharedClientAuthenticatedMultipart.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_sharedClientAuthenticatedMultipart.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"cache-control"];
    });
    
    NSString *token = [userDefaults objectForKey:apiKeyAuth];
    NSString *theTokenData = [NSString stringWithFormat:@"Bearer %@", token];
    
    // Authentication
    [_sharedClientAuthenticatedMultipart.requestSerializer setValue:theTokenData forHTTPHeaderField:@"Authorization"];
    
    return _sharedClientAuthenticatedMultipart;
}

@end
