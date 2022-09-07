//
//  ReviewCollectionView.h
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//

#import <UIKit/UIKit.h>
#import "ReviewResponse.h"
#import "ReviewCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReviewCollectionView : UICollectionView
@property NSArray<ReviewResponse * > * reviews;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout initWithReviews :(NSArray <ReviewResponse * >*) reviews;
@end

NS_ASSUME_NONNULL_END
