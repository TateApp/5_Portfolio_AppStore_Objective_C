//
//  APICaller.m
//  App Store
//
//  Created by Tate Wrigley on 01/09/2022.
//

#import "APICaller.h"


@interface APICaller()



@end
@implementation APICaller

+ (id)shared {
    static APICaller * shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

//MARK: - ReturnType - ParameterType
//:(void (^) (void))completion
- (void)search: (NSString *)query number:(NSString *)number :(void (^) (NSArray<SearchResponse*>* ))completion {
    
    NSString * _query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString * url = @"https://itunes.apple.com/search?term=";
   
    
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@/%@/%@", url, _query, @"&entity=software"]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        NSError * err;
        
        NSDictionary * arrayOFJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&err];
        
        
        NSMutableArray<SearchResponse*>* searchResult = [NSMutableArray new];
        
      
//        searchResult arrayByAddingObject:
        NSArray * results = arrayOFJSON[@"results"];
       
      
        
      
        NSLog(@"%@",results);
        
        for (NSDictionary * keys in results ) {


            NSString * trackName = keys[@"trackCensoredName"];

            NSLog(@"Artist Name: %@", trackName);

            [searchResult addObject:[[SearchResponse alloc] init: trackName]];

        }
      
        
//
//        for (int i = 0; i <= arrayOFJSON.count; i++)
//        {
//            NSLog(@"%@", [arrayOFJSON objectAtIndex:i]);
//        }
//
//        for (NSString* key in arrayOFJSON) {
//
//            NSLog(@"%@", key);
//            if key == @"results" {
//
//            }
//
//                    }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion(searchResult );
            
            
        });
        
    }] resume];
}
- (void)generic :(void (^) (NSArray<SearchResponse*>* ))completion {
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=Instagram&entity=software"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        NSError * err;
        
        NSDictionary * arrayOFJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&err];
        
        
        NSMutableArray<SearchResponse*>* searchResult = [NSMutableArray new];
        
      
//        searchResult arrayByAddingObject:
        NSArray * results = arrayOFJSON[@"results"];
       
      
        
      
        NSLog(@"%@",results);
        
        for (NSDictionary * keys in results ) {
        
           
            NSString * _artistID = keys[@"artistId"];
            
            NSLog(@"Artist ID: %@", _artistID);
            
            [searchResult addObject:[[SearchResponse alloc] init: _artistID]];
            
        }
      
        
        
//        for (int i = 0; i <= arrayOFJSON.count; i++)
//        {
//            NSLog(@"%@", [arrayOFJSON objectAtIndex:i]);
//        }
        
//        for (NSString* key in arrayOFJSON) {
//            
//            NSLog(@"%@", key);
//            if key == @"results" {
//                
//            }
//           
//                    }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion(searchResult );
            
            
        });
        
    }] resume];
}


@end
