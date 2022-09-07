//
//  ReviewResponse.h
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewResponse : NSObject

@property NSString * name;
@property NSString * content;
@property NSString * stars;


- (instancetype) initWithName:(NSString * )name initWithContent:(NSString * )content;


@end

NS_ASSUME_NONNULL_END
