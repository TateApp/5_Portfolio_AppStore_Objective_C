//
//  ReviewCollectionViewCell.h
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//

#import <UIKit/UIKit.h>
#import "ReviewResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewCollectionViewCell : UICollectionViewCell



- (void) setup: (ReviewResponse * ) review;

@end

NS_ASSUME_NONNULL_END
