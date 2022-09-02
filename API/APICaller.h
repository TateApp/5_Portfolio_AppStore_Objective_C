//
//  APICaller.h
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import <Foundation/Foundation.h>
#import "SearchResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface APICaller : NSObject

+ (id)shared;

- (void)generic :(void (^) (NSArray<SearchResponse*>* ))completion;

- (void)search: (NSString *)query number:(NSString *)number :(void (^) (NSArray<SearchResponse*>* ))completion;


@end

NS_ASSUME_NONNULL_END
