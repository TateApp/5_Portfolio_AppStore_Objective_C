//
//  ReviewCollectionViewCell.m
//  App Store
//
//  Created by Tate Wrigley on 06/09/2022.
//


#import "ReviewCollectionViewCell.h"

@interface ReviewCollectionViewCell()

@property UILabel * nameLabel;

@property UILabel * reviewLabel;


@property UIView * view;


@end

@implementation ReviewCollectionViewCell


- (void) setup: (ReviewResponse * ) review  {
    
    
    self.nameLabel.text = review.name;
    self.reviewLabel.text = review.content;
    
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    
        
        self.view = [UIView new];
        
        [self.contentView addSubview:self.view];
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        [self.view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
        [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
        [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
        [self.view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
        self.view.backgroundColor = [UIColor systemGray6Color];
        self.view.layer.cornerRadius = 20;
        
        //MARK: -
        self.nameLabel = [UILabel new];
        [self.view addSubview:self.nameLabel];
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
        [self.nameLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
        [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
        [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [self.nameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        //MARK: -
        
        self.reviewLabel = [UILabel new];
        [self.view addSubview:self.reviewLabel];
        self.reviewLabel.translatesAutoresizingMaskIntoConstraints = false;
        [self.reviewLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:10].active = YES;
        [self.reviewLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
        [self.reviewLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
        
        [self.reviewLabel.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
        self.reviewLabel.numberOfLines = 4;
        self.reviewLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return self;
    
}
@end
