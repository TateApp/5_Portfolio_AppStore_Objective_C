//
//  ReviewCollectionView.m
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//

#import "ReviewCollectionView.h"

@interface ReviewCollectionView() <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@end

@implementation ReviewCollectionView

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ReviewCollectionViewCell  * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReviewCollectionViewCell" forIndexPath:indexPath];
    
    [cell setup:[_reviews objectAtIndex: indexPath.row]];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 200);
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.reviews.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout initWithReviews :(NSArray <ReviewResponse * >*) reviews {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.reviews = reviews;
        
        self.delegate = self;
        
        self.dataSource = self;
        
        [self registerClass:ReviewCollectionViewCell.class forCellWithReuseIdentifier:@"ReviewCollectionViewCell"];
        
        
    }
    
    return self;
    
}

@end
