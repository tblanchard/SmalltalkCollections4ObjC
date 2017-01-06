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

@interface NSArray (SmalltalkCollections)

- (instancetype)do:(ElementMutator)block;
- (instancetype)doWithIndex:(IndexedMutator)block;
- (instancetype)collect:(ElementTransformer)block;
- (instancetype)collectWithIndex:(IndexedTransformer)block;
- (id)detect:(ElementFilter)block;
- (id)detect:(ElementFilter)block ifNone:(ElementDefault)none;
- (id)inject:(id)initial into:(ElementInjector)block;
- (instancetype)reject:(ElementFilter)block;
- (instancetype)select:(ElementFilter)block;

-(instancetype)copyWithout:(id)object;
-(instancetype)copyWith:(id)object;

-(id)at:(NSUInteger)idx;
-(id)at:(NSUInteger)idx ifAbsent:(ElementDefault)block;

@end

@interface NSMutableArray (SmalltalkCollections)

-(void)at:(NSUInteger)idx put:(id)object;

@end
