//
//  Search.h
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import <UIKit/UIKit.h>
#import "SearchResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface Search : UIViewController

@end



@interface SearchCell : UICollectionViewCell

- (void) setup: (SearchResponse * )search;


@end

NS_ASSUME_NONNULL_END
