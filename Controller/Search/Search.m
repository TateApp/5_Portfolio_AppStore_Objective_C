//
//  Search.m
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import "Search.h"
#import "APICaller.h"
#import "CustomImageView.h"
#import "AppViewController.h"
#import "Seperator.h"
@interface Search () <UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property UIScrollView * scrollView ;
@property UIView * contentView;


//MARK: -
@property UILabel * searchLabel;
@property UISearchBar * searchBar;

@property UILabel * discover;

@property UILabel * suggested;

@property UICollectionView * collectionView;

@property (retain) NSArray<SearchResponse * >* data;


@end

@implementation Search

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    NSLog(@"%f", scrollView.contentOffset.y);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@", [self.data objectAtIndex:indexPath.row].trackID);
    [self.navigationController pushViewController: [[AppViewController alloc] initWithID: [self.data objectAtIndex:indexPath.row].trackID] animated:true];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return self.data.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    
    SearchCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Search" forIndexPath:indexPath];
    
    
    [cell setup:[self.data objectAtIndex:indexPath.row]];
    
    return cell;
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(collectionView.frame.size.width, 90);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = UIColor.whiteColor;
    

    [self setupScrollView];
    
    [self setupSearch];
    
    [self setupModel];
    
    
    
    
    
  
}
- (void) setupModel {
    
    [APICaller.shared search:@"Apple" number:@"5" :^(NSArray<SearchResponse *> * Search) {
        NSLog(@"Search: %@", Search);

        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.data = Search;
            
            [self setupCollectionView];
            
            });
        
        
    }];
}

- (void) setupScrollView {
    
    self.scrollView = [UIScrollView new];
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 1500);
    self.scrollView.backgroundColor = UIColor.whiteColor;
    self.scrollView.delegate = self;
    
    self.contentView = [UIView new];
    
    [self.scrollView addSubview:self.contentView];
    self.contentView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    [self.contentView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    [self.contentView.widthAnchor constraintEqualToConstant:self.scrollView.contentSize.width].active = YES;
    [self.contentView.heightAnchor constraintEqualToConstant:self.scrollView.contentSize.height].active = YES;
    
    self.contentView.backgroundColor = UIColor.whiteColor;
    
    
    
}
- (void) setupSearch {
    
    //MARK: -
    self.searchLabel = [UILabel new];
    
    [self.contentView addSubview:self.searchLabel];
    self.searchLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.searchLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.searchLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    
    self.searchLabel.text = @"Search";
    self.searchLabel.font = [UIFont boldSystemFontOfSize:35];
    self.searchLabel.textColor = UIColor.blackColor;
    
    //MARK: -
    
    self.searchBar = [UISearchBar new];
    
    [self.contentView addSubview: self.searchBar];
    self.searchBar.translatesAutoresizingMaskIntoConstraints = false;
    [self.searchBar.topAnchor constraintEqualToAnchor:self.searchLabel.bottomAnchor constant:10].active = YES;
    [self.searchBar.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.searchBar.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.searchBar.heightAnchor constraintEqualToConstant:50].active = YES;
    self.searchBar.placeholder = @"Games, Apps, Stories and More";
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    
    self.discover = [UILabel new];
    
    [self.contentView addSubview:self.discover];
    self.discover.translatesAutoresizingMaskIntoConstraints = false;
    self.discover.text = @"Discover";
    self.discover.font = [UIFont boldSystemFontOfSize:25];
    [self.discover.topAnchor constraintEqualToAnchor:self.searchBar.bottomAnchor constant:30].active = YES;
    [self.discover.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    
    Seperator * seperator = [Seperator new];
    
    [self.contentView addSubview:seperator];
    
    seperator.translatesAutoresizingMaskIntoConstraints = false;
    [seperator.topAnchor constraintEqualToAnchor:self.discover.bottomAnchor constant:10].active = YES;
    [seperator.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    
    //MARK: -
    UIButton * blurEffect = [UIButton buttonWithType: UIButtonTypeSystem];
    
    [self.contentView addSubview:blurEffect];
    blurEffect.translatesAutoresizingMaskIntoConstraints = false;
    [blurEffect setTitle:@"blur effect" forState:UIControlStateNormal];
    blurEffect.titleLabel.font = [UIFont systemFontOfSize:20];
    [blurEffect.topAnchor constraintEqualToAnchor:seperator.bottomAnchor constant:10].active = YES;
    [blurEffect.leadingAnchor constraintEqualToAnchor:seperator.leadingAnchor constant:10].active = YES;
    
    Seperator * seperator1 = [Seperator new];
    
    [self.contentView addSubview:seperator1];
    
    seperator1.translatesAutoresizingMaskIntoConstraints = false;
    [seperator1.topAnchor constraintEqualToAnchor:blurEffect.bottomAnchor constant:10].active = YES;
    [seperator1.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    
    //MARK: -
    UIButton * carGames = [UIButton buttonWithType: UIButtonTypeSystem];
    
    [self.contentView addSubview:carGames];
    carGames.translatesAutoresizingMaskIntoConstraints = false;
    [carGames setTitle:@"car games" forState:UIControlStateNormal];
    carGames.titleLabel.font = [UIFont systemFontOfSize:20];
    [carGames.topAnchor constraintEqualToAnchor:seperator1.bottomAnchor constant:10].active = YES;
    [carGames.leadingAnchor constraintEqualToAnchor:seperator.leadingAnchor constant:10].active = YES;
    
    
    Seperator * seperator2 = [Seperator new];
    
    [self.contentView addSubview:seperator2];
    
    seperator2.translatesAutoresizingMaskIntoConstraints = false;
    [seperator2.topAnchor constraintEqualToAnchor:carGames.bottomAnchor constant:10].active = YES;
    [seperator2.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    
    //MARK: -
    UIButton * current_converter = [UIButton buttonWithType: UIButtonTypeSystem];
    
    [self.contentView addSubview:current_converter];
    current_converter.translatesAutoresizingMaskIntoConstraints = false;
    [current_converter setTitle:@"current converter" forState:UIControlStateNormal];
    current_converter.titleLabel.font = [UIFont systemFontOfSize:20];
    [current_converter.topAnchor constraintEqualToAnchor:seperator2.bottomAnchor constant:10].active = YES;
    [current_converter.leadingAnchor constraintEqualToAnchor:seperator.leadingAnchor constant:10].active = YES;
    
    Seperator * seperator3 = [Seperator new];
    
    [self.contentView addSubview:seperator3];
    
    seperator3.translatesAutoresizingMaskIntoConstraints = false;
    [seperator3.topAnchor constraintEqualToAnchor:current_converter.bottomAnchor constant:10].active = YES;
    [seperator3.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    
    //MARK: -
    UIButton * alarm_clock = [UIButton buttonWithType: UIButtonTypeSystem];
    
    [self.contentView addSubview:alarm_clock];
    alarm_clock.translatesAutoresizingMaskIntoConstraints = false;
    [alarm_clock setTitle:@"alarm clock" forState:UIControlStateNormal];
    alarm_clock.titleLabel.font = [UIFont systemFontOfSize:20];
    [alarm_clock.topAnchor constraintEqualToAnchor:seperator3.bottomAnchor constant:10].active = YES;
    [alarm_clock.leadingAnchor constraintEqualToAnchor:seperator.leadingAnchor constant:10].active = YES;
    
    
    self.suggested = [UILabel new];
    
    [self.contentView addSubview:self.suggested];
    self.suggested.translatesAutoresizingMaskIntoConstraints = false;
    self.suggested.text = @"Suggested";
    self.suggested.font = [UIFont boldSystemFontOfSize:25];
    [self.suggested.topAnchor constraintEqualToAnchor:alarm_clock.bottomAnchor constant:30].active = YES;
    [self.suggested.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    
    
    Seperator * seperator4 = [Seperator new];
    
    [self.contentView addSubview:seperator4];
    
    seperator4.translatesAutoresizingMaskIntoConstraints = false;
    [seperator4.topAnchor constraintEqualToAnchor:self.suggested.bottomAnchor constant:10].active = YES;
    [seperator4.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    
}
- (void) setupCollectionView  {
    
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    [self.contentView addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.suggested.bottomAnchor constant:20].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.collectionView.heightAnchor constraintEqualToConstant:1000].active = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:SearchCell.class forCellWithReuseIdentifier:@"Search"];
    self.collectionView.scrollEnabled = false;
    
    
}
@end







@interface SearchCell()

@property UILabel * topLabel;

@property UILabel * bottomLabel;

@property CustomImageView * image ;

@property UIButton * getButton;


@end


@implementation SearchCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];

    if (self) {
        
        self.image = [[CustomImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.image];
        self.image.translatesAutoresizingMaskIntoConstraints = false;
        [self.image.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [self.image.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
        
        [self.image.widthAnchor constraintEqualToConstant:70].active = YES;
        [self.image.heightAnchor constraintEqualToConstant:70].active = YES;
        
        
        
        
        self.image.layer.cornerRadius = 10;
        self.image.clipsToBounds = true;
        
        
        
        
        self.topLabel = [UILabel new];
        [self.contentView addSubview:self.topLabel];
        self.topLabel.translatesAutoresizingMaskIntoConstraints = false;
        [self.topLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
        [self.topLabel.leadingAnchor constraintEqualToAnchor:self.image.trailingAnchor constant:10].active = YES;
        self.topLabel.text = @"Top Label";
        
        //MARK: -
        self.getButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.getButton];
        self.getButton.translatesAutoresizingMaskIntoConstraints = false;
        [self.getButton.widthAnchor constraintEqualToConstant:75].active = YES;
        [self.getButton.heightAnchor constraintEqualToConstant:25].active = YES;
        [self.getButton setTitle:@"GET" forState:UIControlStateNormal];
        self.getButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        self.getButton.layer.cornerRadius = 12.5;
        self.getButton.backgroundColor = [UIColor.systemGray3Color colorWithAlphaComponent:0.95];
      
        [self.getButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        [self.getButton.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
        
        //MARK: -
        self.bottomLabel = [UILabel new];
        [self.contentView addSubview:self.bottomLabel];
        self.bottomLabel.translatesAutoresizingMaskIntoConstraints = false;
        [self.bottomLabel.topAnchor constraintEqualToAnchor:self.topLabel.bottomAnchor constant:10].active = YES;
        [self.bottomLabel.leadingAnchor constraintEqualToAnchor:self.image.trailingAnchor constant:10].active = YES;
        self.bottomLabel.text = @"Bottom Label";
        
        [self.bottomLabel.trailingAnchor constraintEqualToAnchor:self.getButton.leadingAnchor constant:-10].active = YES;
        [self.bottomLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
        
        
        Seperator * seperator = [Seperator new];
        
        [self.contentView addSubview:seperator];
        seperator.translatesAutoresizingMaskIntoConstraints = false;
        [seperator.leadingAnchor constraintEqualToAnchor:self.image.trailingAnchor constant:10].active = YES;
        [seperator.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10].active = YES;
        [seperator.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;

        
    }
    
    return self;
    
}

- (void) setup: (SearchResponse * )search {
    
    self.topLabel.text = search.trackName;
    
    self.bottomLabel.text = search.theDescription;
    
    [self.image loadImage:search.artworkUrl60];
}

@end
