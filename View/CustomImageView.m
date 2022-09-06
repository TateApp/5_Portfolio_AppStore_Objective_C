//
//  CustomImageView.m
//  App Store
//
//  Created by Tate Wrigley on 02/09/2022.
//

#import "CustomImageView.h"
@interface CustomImageView ()

@property UIActivityIndicatorView * activity;

@end

@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame  {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
//        NSLog(@"Loaded");
//        self.activity = [UIActivityIndicatorView new];
//        [self addSubview:self.activity];
//        self.activity.translatesAutoresizingMaskIntoConstraints = false;
//        [self.activity.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
//        [self.activity.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
//        [self.activity.widthAnchor constraintEqualToConstant:50].active = YES;
//        [self.activity.heightAnchor constraintEqualToConstant:50].active = YES;
//        self.activity.color = UIColor.blackColor;
        
        self.backgroundColor = UIColor.systemGray6Color;
        
        
        
    }
    return self;
}

- (void )loadImage: (NSString * ) url {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        
        self.image = [[UIImage alloc] initWithData:imageData];
        
        
        
    });
   
    
    
}

@end
