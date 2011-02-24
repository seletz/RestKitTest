//
//  ProjectModel.h
//  RestKitTest
//
//  Created by Stephan Eletzhofer on 24.02.11.
//  Copyright 2011 Nexiles GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>


@interface ProjectModel : RKObject {
	
	NSNumber * _identifier;
	NSString  * _name;
	NSString  * _text;
}

@property (nonatomic, retain) NSNumber *identifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *text;

+ (NSDictionary*)elementToPropertyMappings;

- (NSString *)description;

@end
