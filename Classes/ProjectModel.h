//
//  ProjectModel.h
//  RestKitTest
//
//  Created by Stephan Eletzhofer on 24.02.11.
//  Copyright 2011 Nexiles GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProjectModel : NSObject {
	
	NSInteger * _identifier;
	NSString  * _name;
	NSString  * _text;
}

@property (nonatomic, assign) NSInteger *identifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *text;

@end
