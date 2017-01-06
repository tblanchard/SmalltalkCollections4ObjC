//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//

#ifndef Collections_h
#define Collections_h

// Common Block Typedefs
typedef BOOL    (^ElementFilter)(id); // select:, detect:, reject:
typedef void    (^ElementMutator)(id); // do:
typedef id      (^ElementTransformer)(id); // collect:

typedef BOOL    (^CharacterFilter)(unichar); // NSString select: detect: reject:
typedef void    (^CharacterMutator)(unichar); // NSString do:
typedef unichar (^CharacterTransformer)(unichar); // collect:

typedef id   (^IndexedTransformer)(id,NSInteger);
typedef void (^IndexedMutator)(id,NSInteger);
typedef void (^PairedMutator)(NSString*,id);
typedef BOOL (^PairedFilter)(NSString*,id);
typedef id (^ElementDefault)(void);
typedef id (^ElementInjector)(id, id);

typedef void (^StringMutator)(NSString *);

typedef void(^ElementIterator)(NSInteger);

#import "NSArray+Collections.h"
#import "NSDictionary+Collections.h"
#import "NSNumber+Collections.h"
#import "NSSet+Collections.h"

#endif /* Collections_h */
