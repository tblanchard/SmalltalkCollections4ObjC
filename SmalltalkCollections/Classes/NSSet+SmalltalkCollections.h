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

@interface NSSet (SmalltalkCollections)

- (instancetype)do:(ElementMutator)block;
- (instancetype)collect:(ElementTransformer)block;
- (id)inject:(id)initial into:(ElementInjector)block;
- (instancetype)reject:(ElementFilter)block;
- (instancetype)select:(ElementFilter)block;

-(instancetype)copyWithout:(id)object;
-(instancetype)copyWith:(id)object;

@end
