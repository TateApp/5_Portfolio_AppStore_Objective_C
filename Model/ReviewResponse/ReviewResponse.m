//
//  ReviewResponse.m
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//

#import "ReviewResponse.h"

@implementation ReviewResponse


- (instancetype) initWithName:(NSString * )name initWithContent:(NSString * )content  {

    self = [super init];
    
    if (self) {
        
        self.name = name;
        self.content = content;
        
    }
    return self;
    
    
}
@end
