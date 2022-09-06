//
//  APICaller.h
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import <Foundation/Foundation.h>
#import "SearchResponse.h"
#import "AppResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface APICaller : NSObject

+ (id)shared;



- (void)search: (NSString *)query number:(NSString *)number :(void (^) (NSArray<SearchResponse*>* ))completion;


- (void)lookup: (NSString *)query :(void (^) (AppResponse* ))completion;

@end

NS_ASSUME_NONNULL_END
