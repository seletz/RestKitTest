//
//  ProjectModel.m
//  RestKitTest
//
//  Created by Stephan Eletzhofer on 24.02.11.
//  Copyright 2011 Nexiles GmbH. All rights reserved.
//

#import "ProjectModel.h"


@implementation ProjectModel

@synthesize identifier = _identifier;
@synthesize name = _name;
@synthesize text = _text;

+ (NSDictionary*)elementToPropertyMappings {
	return [NSDictionary dictionaryWithKeysAndObjects:
			@"id", @"identifier",
			@"name", @"name",
			@"text", @"text",
			nil];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<Project id=%@ name=%@ text=%@>", self.identifier, self.name, self.text];
}

@end
