//
//  Seperator.m
//  App Store
//
//  Created by Tate Wrigley on 03/09/2022.
//

#import "Seperator.h"

@interface Seperator()

@end

@implementation Seperator

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        
        [self.heightAnchor constraintEqualToConstant:1].active = YES;
        [self.widthAnchor constraintEqualToConstant:UIScreen.mainScreen.bounds.size.width - 20].active = YES;
        
        self.backgroundColor = UIColor.systemGray3Color;
        
    }
    return self;
}

@end

