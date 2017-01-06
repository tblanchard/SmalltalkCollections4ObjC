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

@class MDPair;


@interface NSSet (SmalltalkCollections)
- (NSSet *)do:(ElementMutator)block;
- (NSSet *)collect:(ElementTransformer)block;
- (id)inject:(id)initial into:(ElementInjector)block;
- (NSSet *)reject:(ElementFilter)block;
- (NSSet *)select:(ElementFilter)block;
@end
