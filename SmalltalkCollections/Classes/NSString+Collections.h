//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import <Foundation/Foundation.h>
#import "SmalltalkCollections.h"

@interface NSString (SmalltalkCollections)

-(NSString*)collect:(CharacterTransformer)block;
-(NSString*)select:(CharacterFilter)block;
-(NSString*)reject:(CharacterFilter)block;
-(NSString*)detect:(CharacterFilter)block;
-(void)do:(CharacterMutator)block;
-(void)linesDo:(StringMutator)block;

@end
