//
//  ModelTemplate.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "ModelTemplate.h"

@implementation ModelTemplate

// MARK: Init
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        // Declate ids for every property
        id cModelPropertyID;
        id cModelPropertyName;
        id cModelPropertyDescription;
        
        // Assign data to ids
        cModelPropertyID =                                      [dictionary objectForKey:@"id"];
        cModelPropertyName =                                    [dictionary objectForKey:@"name"];
        cModelPropertyDescription =                             [dictionary objectForKey:@"guest"];
        
        // Null checks
        nullCheckString(cModelPropertyID);
        nullCheckString(cModelPropertyName);
        nullCheckString(cModelPropertyDescription);
        
        // Assign data to model properties
        self.modelPropertyID =                                  cModelPropertyID;
        self.modelPropertyName =                                cModelPropertyName;
        self.modelPropertyDescription =                         cModelPropertyDescription;
    }
    
    return self;
}

// MARK: Description
- (NSString *)description {
    NSString *description = [NSString stringWithFormat:@"ID: %@, Name: %@, Description: %@",
                             self.modelPropertyID,
                             self.modelPropertyName,
                             self.modelPropertyDescription];
    
    return description;
}

// MARK: Coding & Decoding
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.modelPropertyID                   forKey:@"modelPropertyID"];
    [encoder encodeObject:self.modelPropertyName                 forKey:@"modelPropertyName"];
    [encoder encodeObject:self.modelPropertyDescription          forKey:@"modelPropertyDescription"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.modelPropertyID =                                   [decoder decodeObjectForKey:@"modelPropertyID"];
        self.modelPropertyName =                                 [decoder decodeObjectForKey:@"modelPropertyName"];
        self.modelPropertyDescription =                          [decoder decodeObjectForKey:@"modelPropertyDescription"];
    }
    
    return self;
}


@end
