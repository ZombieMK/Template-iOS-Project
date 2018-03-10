//
//  ModelTemplate.h
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTemplate : NSObject

@property (nonatomic) NSString *modelPropertyID;
@property (nonatomic) NSString *modelPropertyName;
@property (nonatomic) NSString *modelPropertyDescription;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
