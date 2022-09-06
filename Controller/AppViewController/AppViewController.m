//
//  AppViewController.m
//  App Store
//
//  Created by Tate Wrigley on 02/09/2022.
//

#import "AppViewController.h"
#import "APICaller.h"
#import "CustomImageView.h"
#import "Seperator.h"
@interface AppViewController ()

@property (retain) AppResponse * app;
@property CGFloat * extraHeight;
@property BOOL stateOfMoreButton;


@property UIView * topBar;
@property UIButton * backButton;
@property UIButton * downloadButtonTop;

//MARK: -
@property UIScrollView * scrollView;
@property UIView * contentView;
//MARK: -


@property CustomImageView * mainAppIcon;
@property UILabel * titleLabel;
@property UILabel * secondTitle;
@property UIButton * downloadButton;
@property UIButton * shareButton;

//MARK: -
@property Seperator * seperator;
//MARK: -

@property UIScrollView * scrollView2;
@property UIView * contentView2;

@property UILabel * ratingsLabelNumber;
@property UILabel * ratingsLabel;

@property UILabel * ageLabelText;
@property UILabel * ageLabel;

@property UILabel * categoryLabelText;
@property UILabel * categoryLabel;

@property UILabel * developerLabelText;
@property UILabel * developerLabel;

@property UILabel * languageLabelText;
@property UILabel * languageLabel;

//MARK: -
@property Seperator * descriptionSeperator;

@property UILabel * descriptionLabel;

@property UIButton * descriptionLabelButton;



@property NSLayoutConstraint * descriptionLabelHeightAnchor;

//MARK: -

@property ScreenShotCollectionView * screenShotCollectionView ;

@end

@implementation AppViewController


- (instancetype) initWithID: (NSString * ) appID {
    
    self = [super initWithNibName:NULL bundle:NULL];
    
    if (self) {
        
        NSLog(@"%@", appID);
        self.appID = appID;
        
        [APICaller.shared lookup:self.appID:^(AppResponse * appResponse) {
            
            self.app = appResponse;
            
            [self setupView];
            
        }];
        
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.stateOfMoreButton = false;
    
 
    
   
  
    
}
- (void) setupView {
    
    [self setupTopBar];
    
    [self setupScrollView];
    
    [self setupTopView];
    

    
    [self setupScrollView2];
    
    [self setupCollectionView];
    
    [self setupDescription];
    
    
}

- (void) setupTopBar  {
    
    self.topBar = [UIView new];
    
    [self.view addSubview:self.topBar];
    self.topBar.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.topBar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.topBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.topBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.topBar.heightAnchor constraintEqualToConstant:100].active = YES;
    self.topBar.backgroundColor = UIColor.redColor;
    
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.topBar addSubview:self.backButton];
    self.backButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.backButton setTitle:@"< Search" forState:UIControlStateNormal];
    [self.backButton.bottomAnchor constraintEqualToAnchor:self.topBar.bottomAnchor].active = YES;
    [self.backButton.leadingAnchor constraintEqualToAnchor:self.topBar.leadingAnchor constant:10].active = YES;
    self.backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) backButtonPressed: (UIButton *) sender {
    
    
    
}



 
- (void) setupScrollView {
    
    self.scrollView = [UIScrollView new];
    
    [self.view addSubview: self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.self.topBar.bottomAnchor].active = YES;
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 1000);
    self.scrollView.backgroundColor = UIColor.whiteColor;
    
    
    //MARK: -
    
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


- (void) setupTopView {
    
    self.mainAppIcon = [CustomImageView new];
    
    [self.contentView addSubview:self.mainAppIcon];
    self.mainAppIcon.translatesAutoresizingMaskIntoConstraints = false;
    [self.mainAppIcon.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.mainAppIcon.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.mainAppIcon.widthAnchor constraintEqualToConstant:UIScreen.mainScreen.bounds.size.width / 4].active = YES;
    [self.mainAppIcon.heightAnchor constraintEqualToConstant:UIScreen.mainScreen.bounds.size.width / 4].active = YES;
    [self.mainAppIcon loadImage:self.app.artworkUrl512];
    self.mainAppIcon.layer.cornerRadius = 20;
    self.mainAppIcon.clipsToBounds = true;
    
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.mainAppIcon.topAnchor constant:10].active = YES;
    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.mainAppIcon.trailingAnchor constant:10].active = YES;
    self.titleLabel.text = self.app.trackName;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    
    self.secondTitle = [UILabel new];
    [self.contentView addSubview:self.secondTitle];
    self.secondTitle.translatesAutoresizingMaskIntoConstraints = false;
    [self.secondTitle.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:10].active = YES;
    [self.secondTitle.leadingAnchor constraintEqualToAnchor:self.mainAppIcon.trailingAnchor constant:10].active = YES;
    self.secondTitle.text = self.app.theDescription;
    self.secondTitle.font = [UIFont systemFontOfSize: 15];
    self.secondTitle.textColor = UIColor.systemGray3Color;
    
    self.downloadButton = [UIButton new];
    [self.contentView addSubview:self.downloadButton];
    self.downloadButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.downloadButton.leadingAnchor constraintEqualToAnchor:self.mainAppIcon.trailingAnchor constant:10].active = YES;
    [self.downloadButton.bottomAnchor constraintEqualToAnchor:self.mainAppIcon.bottomAnchor].active = YES;
    [self.downloadButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.downloadButton setTitle:@"GET" forState:UIControlStateNormal];
    self.downloadButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.downloadButton.backgroundColor = UIColor.systemBlueColor;
    [self.downloadButton.widthAnchor constraintEqualToConstant:70].active = YES;
    [self.downloadButton.heightAnchor constraintEqualToConstant:25].active = YES;
    self.downloadButton.layer.cornerRadius = 12.5;

    self.seperator = [Seperator new];
    [self.view addSubview:self.seperator];
    self.seperator.translatesAutoresizingMaskIntoConstraints = false;
    [self.seperator.topAnchor constraintEqualToAnchor:self.mainAppIcon.bottomAnchor constant:10].active = YES;
    [self.seperator.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.seperator.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    
    
}

- (void) setupScrollView2 {

    self.scrollView2 = [UIScrollView new];
    [self.contentView addSubview:self.scrollView2];
    self.scrollView2.translatesAutoresizingMaskIntoConstraints = false;
    [self.scrollView2.topAnchor constraintEqualToAnchor:self.seperator.bottomAnchor constant:10].active = YES;
    [self.scrollView2.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.scrollView2.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.scrollView2.heightAnchor constraintEqualToConstant:100].active = YES;
    self.scrollView2.backgroundColor = UIColor.redColor;
    self.scrollView2.contentSize = CGSizeMake(1000, 100);
    
    //MARK: -
    self.contentView2 = [UIView new];
    [self.scrollView2 addSubview:self.contentView2];
     self.contentView2.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView2.topAnchor constraintEqualToAnchor:self.scrollView2.topAnchor].active = YES;
    [self.contentView2.leadingAnchor constraintEqualToAnchor:self.scrollView2.leadingAnchor].active = YES;
    [self.contentView2.trailingAnchor constraintEqualToAnchor:self.scrollView2.trailingAnchor].active = YES;
    [self.contentView2.bottomAnchor constraintEqualToAnchor:self.scrollView2.bottomAnchor].active = YES;
    [self.contentView2.widthAnchor constraintEqualToConstant:self.scrollView2.contentSize.width].active = YES;
    [self.contentView2.heightAnchor constraintEqualToConstant:self.scrollView2.contentSize.height].active = YES;
    
    //MARK: -
    
    
}


- (void) setupCollectionView {
    
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    self.screenShotCollectionView = [[ScreenShotCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout screenShots:self.app.screenshotUrls];
    
    self.screenShotCollectionView.showsHorizontalScrollIndicator = false;
    self.screenShotCollectionView.pagingEnabled = true;
    
    [self.contentView addSubview:self.screenShotCollectionView];
    
    self.screenShotCollectionView.translatesAutoresizingMaskIntoConstraints = false;
    [self.screenShotCollectionView.topAnchor constraintEqualToAnchor:self.scrollView2.bottomAnchor constant:10].active = YES;
    [self.screenShotCollectionView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    
    [self.screenShotCollectionView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.screenShotCollectionView.heightAnchor constraintEqualToConstant:200].active = YES;
}

- (void) setupDescription  {

    //MARK: -
    self.descriptionSeperator = [Seperator new];
    [self.contentView addSubview:self.descriptionSeperator];
    self.descriptionSeperator.translatesAutoresizingMaskIntoConstraints = false;
    [self.descriptionSeperator.topAnchor constraintEqualToAnchor:self.screenShotCollectionView.bottomAnchor constant:10].active = YES;
    [self.descriptionSeperator.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.descriptionSeperator.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    
    //MARK: -
    self.descriptionLabel = [UILabel new];
    [self.contentView addSubview:self.descriptionLabel];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.descriptionSeperator.bottomAnchor constant:10].active = YES;
    [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    self.descriptionLabel.text = self.app.theDescription;
    self.descriptionLabel.numberOfLines = 3;
    self.descriptionLabelHeightAnchor = [self.descriptionLabel.heightAnchor constraintEqualToConstant:100];
    self.descriptionLabelHeightAnchor.active = YES;
    
    
    //MARK: -
    self.descriptionLabelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.descriptionLabelButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:self.descriptionLabelButton];
    [self.descriptionLabelButton.trailingAnchor constraintEqualToAnchor:self.descriptionLabel.trailingAnchor].active = YES;
    [self.descriptionLabelButton.topAnchor constraintEqualToAnchor:self.descriptionLabel.bottomAnchor constant:10].active = YES;
    [self.descriptionLabelButton setTitle:@"more" forState:UIControlStateNormal];
    [self.descriptionLabelButton addTarget:self action:@selector(moreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void) moreButtonPressed: (UIButton * )sender {
    
    if (self.stateOfMoreButton == false) {
        [UIView animateWithDuration:0.5 animations:^{
            self.descriptionLabelHeightAnchor.active = false;
            self.descriptionLabel.numberOfLines = 100;
            
            [self.view layoutIfNeeded];
            
        }];
        NSLog(@"%f Height Of Label", self.descriptionLabel.frame.size.height );
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, self.scrollView.contentSize.height + self.descriptionLabel.frame.size.height);
        self.stateOfMoreButton = true;
        self.descriptionLabelButton.alpha = 0;
        [self.view layoutIfNeeded];

        
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.descriptionLabelHeightAnchor.active = YES;
            self.descriptionLabel.numberOfLines = 3;
            
            [self.view layoutIfNeeded];
            
        }];
        NSLog(@"%f Height Of Label", self.descriptionLabel.frame.size.height );
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, 1000);
        [self.view layoutIfNeeded];
        
        self.stateOfMoreButton = false;
    }
    
}

@end


@interface ScreenShotCollectionView() <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property NSArray<NSString *> * array;

@end

@implementation ScreenShotCollectionView

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return  CGSizeMake(UIScreen.mainScreen.bounds.size.width - 20, 200);
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ScreenShotCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ScreenShotCollectionViewCell" forIndexPath:indexPath];
    
    
    
    [cell setup: [self.array objectAtIndex:indexPath.row]];
    
    return cell;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
 
    return self.array.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout screenShots: (NSArray<NSString * > *)array {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.delegate = self;
        
        self.dataSource = self;
        
        self.array = array;
        
        [self registerClass:ScreenShotCollectionViewCell.class forCellWithReuseIdentifier:@"ScreenShotCollectionViewCell"];
        
    }
    
    return self;
    
}

@end

@interface ScreenShotCollectionViewCell()

@property CustomImageView * customImageView;

@end

@implementation ScreenShotCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.customImageView = [CustomImageView new];
        
        [self.contentView addSubview: self.customImageView];
        self.customImageView.translatesAutoresizingMaskIntoConstraints = false;
        [self.customImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [self.customImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
        [self.customImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
        [self.customImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        self.customImageView.layer.cornerRadius = 20;
        self.customImageView.clipsToBounds = true;
        self.customImageView.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return self;
}

- (void)setup:(NSString *)url {
    
    [self.customImageView loadImage:url];
}


@end
