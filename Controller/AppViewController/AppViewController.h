//
//  AppViewController.h
//  App Store
//
//  Created by Tate Wrigley on 02/09/2022.
//

#import <UIKit/UIKit.h>
#import "ReviewResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppViewController : UIViewController


@property (retain) NSString * appID;

@property (retain) NSArray<ReviewResponse * > * reviews;


- (instancetype) initWithID: (NSString * ) appID;

@end


@interface ScreenShotCollectionView : UICollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout screenShots: (NSArray<NSString * > *)array;

@end

@interface ScreenShotCollectionViewCell : UICollectionViewCell

- (void) setup: (NSString *)url;

@end


NS_ASSUME_NONNULL_END
