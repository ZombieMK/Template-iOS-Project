//
//  NetworkClient.h
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkClient : AFHTTPSessionManager

+ (NetworkClient *)sharedClient;
+ (NetworkClient *)sharedClientAuthenticated;
+ (NetworkClient *)sharedClientAuthenticatedMultipart;

@end
