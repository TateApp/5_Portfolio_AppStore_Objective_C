//
//  ViewController.m
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import "TabBarController.h"
#import "Apps.h"
#import "Search.h"
#import "APICaller.h"
@interface TabBarController ()

@property NSArray<UIViewController * > * viewControlleArray;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupTabBar];
    
  
  }


- (void) setupTabBar {
    
    self.tabBar.backgroundColor = UIColor.systemGray6Color;
     
    
    
    self.viewControlleArray = [[NSArray alloc] initWithObjects:[Search new], nil];
    
    self.selectedIndex = 0;
    
    self.viewControllers = self.viewControlleArray;
    
//    //MARK: -
//    [self.viewControllers objectAtIndex:0].title = @"Apps";
//    [self.viewControllers objectAtIndex:0].tabBarItem.image = [[UIImage imageNamed:@"Apps"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self.viewControllers objectAtIndex:0].tabBarItem.selectedImage = [[UIImage imageNamed:@"Apps Selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    [self.viewControllers objectAtIndex:0].tabBarItem.imageInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //MARK: -
    [self.viewControllers objectAtIndex:0].title = @"Search";
    [self.viewControllers objectAtIndex:0].tabBarItem.image = [[UIImage imageNamed:@"Search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.viewControllers objectAtIndex:0].tabBarItem.selectedImage = [[UIImage imageNamed:@"Search Selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.viewControllers objectAtIndex:0].tabBarItem.imageInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    

    
}

@end
