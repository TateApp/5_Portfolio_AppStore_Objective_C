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

- (void)lookup: (NSString *)query :(void (^) (AppResponse* ))completion {
    
    NSString * _query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSString * url = @"https://itunes.apple.com/lookup?id=";
   
    
    
    NSString * urlToParse = [NSString stringWithFormat:@"%@%@", url, _query];
    
    
    NSLog(@"%@",  urlToParse);
    
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString: urlToParse] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        NSError * err;
        
        NSDictionary * arrayOFJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&err];
        
        
//        NSMutableArray<SearchResponse*>* searchResult = [NSMutableArray new];
        
      
//        searchResult arrayByAddingObject:
        NSArray * results = arrayOFJSON[@"results"];
       
      
        
        NSLog(@"--------------");
//        NSLog(@"%@",resultss);
        NSLog(@"--------------");
        
        
        AppResponse * appResponse = [AppResponse new];
        for (NSDictionary * keys in results ) {

//            NSLog(@"%@" ,  keys[@"artworkUrl60"]);
            
            NSArray<NSString * >* advisories = keys[@"advisories"];
            NSArray<NSString * >* appletvScreenshotUrls = keys[@"appletvScreenshotUrls"];
            NSString * artistId = keys[@"artistId"];
            NSString * artistName = keys[@"artistName"];
            NSString * artistViewUrl = keys[@"artistViewUrl"];
            NSString * artworkUrl100 = keys[@"artworkUrl100"];
            NSString * artworkUrl512 = keys[@"artworkUrl512"];
            NSString * artworkUrl60 = keys[@"artworkUrl60"];
            NSString * averageUserRating = keys[@"averageUserRating"];
            NSString * averageUserRatingForCurrentVersion = keys[@"averageUserRatingForCurrentVersion"];
            NSString * bundleId = keys[@"bundleId"];
            NSString * contentAdvisoryRating = keys[@"contentAdvisoryRating"];
            NSString * currency = keys[@"currency"];
            NSString * currentVersionReleaseDate = keys[@"currentVersionReleaseDate"];
            NSString * description = keys[@"description"];
            NSArray<NSString * > * features = keys[@"features"];
            NSString * fileSizeBytes = keys[@"fileSizeBytes"];
            NSString * formattedPrice = keys[@"formattedPrice"];
            
            NSArray<NSString * > * genreIds = keys[@"genreIds"];
            NSArray<NSString * > * genres = keys[@"genres"];
            NSArray<NSString * > * ipadScreenshotUrls = keys[@"ipadScreenshotUrls"];
            NSString * isGameCenterEnabled = keys[@"isGameCenterEnabled"];
            NSString * isVppDeviceBasedLicensingEnabled= keys[@"isVppDeviceBasedLicensingEnabled"];
            NSString * kind= keys[@"kind"];
            NSString * languageCodesISO2A= keys[@"languageCodesISO2A"];
            NSString * minimumOsVersion= keys[@"minimumOsVersion"];
            NSString * price= keys[@"price"];
            NSString * primaryGenreId= keys[@"primaryGenreId"];
            NSString * primaryGenreName= keys[@"primaryGenreName"];
            NSString * releaseDate= keys[@"releaseDate"];
            NSString * releaseNotes= keys[@"releaseNotes"];
            NSArray<NSString * > * screenshotUrls = keys[@"screenshotUrls"];
            NSString * sellerName= keys[@"sellerName"];
            NSArray<NSString * > * supportedDevices = keys[@"supportedDevices"];
            NSString * trackCensoredName= keys[@"trackCensoredName"];
            NSString * trackContentRating= keys[@"trackContentRating"];
            NSString * trackId= keys[@"trackId"];
            NSString * trackName= keys[@"trackName"];
            NSString * trackViewUrl= keys[@"trackViewUrl"];
            NSString * userRatingCount= keys[@"userRatingCount"];
            NSString * userRatingCountForCurrentVersion= keys[@"userRatingCountForCurrentVersion"];
            NSString * version= keys[@"version"];
            NSString * wrapperType= keys[@"wrapperType"];


    appResponse = [[AppResponse alloc] init:advisories appletvScreenshotUrls:appletvScreenshotUrls artistId:artistId artistName:artistName artistViewUrl:artistViewUrl artworkUrl100:artworkUrl100 artworkUrl512:artworkUrl512 artworkUrl60:artworkUrl60 averageUserRating:averageUserRating averageUserRatingForCurrentVersion:averageUserRatingForCurrentVersion bundleId:bundleId contentAdvisoryRating:contentAdvisoryRating currency:currency currentVersionReleaseDate:currentVersionReleaseDate theDescription:description features:features fileSizeBytes:fileSizeBytes formattedPrice:formattedPrice genreIds:genreIds genres:genres ipadScreenshotUrls:ipadScreenshotUrls isGameCenterEnabled:isGameCenterEnabled isVppDeviceBasedLicensingEnabled:isVppDeviceBasedLicensingEnabled kind:kind languageCodesISO2A:languageCodesISO2A minimumOsVersion:minimumOsVersion price:price primaryGenreId:primaryGenreId primaryGenreName:primaryGenreName releaseDate:releaseDate releaseNotes:releaseNotes screenshotUrls:screenshotUrls sellerName:sellerName supportedDevices:supportedDevices trackCensoredName:trackCensoredName trackContentRating:trackContentRating trackId:trackId trackName:trackName trackViewUrl:trackViewUrl userRatingCount:userRatingCount userRatingCountForCurrentVersion:userRatingCountForCurrentVersion version:version wrapperType:wrapperType];

        }
      
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion(appResponse  );
            
            
        });
        
    }] resume];
}
- (void)review: (NSString *)query :(void (^) (NSArray<ReviewResponse*>* ))completion {
    
    NSString * _query = query;
   
    NSString * url = @"https://itunes.apple.com/rss/customerreviews/page=1/id=";
   
    NSString * lastPart = @"/sortby=mostrecent/json?1=eb&cc=us";
    
    
    NSString * urlToParse = [NSString stringWithFormat:@"%@%@%@", url, _query, lastPart];
    
    
    NSLog(@"%@",  urlToParse);
    
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString: urlToParse] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        NSError * err;
        
        NSDictionary * arrayOFJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&err];
        
        
//        NSMutableArray<SearchResponse*>* searchResult = [NSMutableArray new];
        
      
//        searchResult arrayByAddingObject:
        NSDictionary * feed = arrayOFJSON[@"feed"];
       
        NSArray * entry = feed[@"entry"];
        
//        NSLog(@"%@", entry);
        
        NSLog(@"--------------");
//        NSLog(@"%@",resultss);
        NSLog(@"--------------");
        
//        NSLog(@"%@", feed);
        
        NSMutableArray<ReviewResponse *> * reviewReponse = [NSMutableArray new];
        for (NSDictionary * keys in entry ) {

//
            NSLog(@"Author Key %@", keys[@"author"]);
            NSLog(@" Content Key %@", keys[@"content"]);

            NSDictionary * author = keys[@"author"];
            NSDictionary * name = author[@"name"];
            NSString * nameString = name[@"label"];
     
            
            
            NSDictionary * content = keys[@"content"];
            NSString * contentString = content[@"label"];
            
            NSLog(@"Name String: %@", nameString);
            NSLog(@"Content String: %@", contentString);
            
            [reviewReponse addObject: [[ReviewResponse alloc] initWithName:nameString initWithContent:contentString]];
            
        }
      
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion(reviewReponse  );
            
            
        });
        
    }] resume];
}
- (void)search: (NSString *)query number:(NSString *)number :(void (^) (NSArray<SearchResponse*>* ))completion {
    
    NSString * _query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString * url = @"https://itunes.apple.com/search?term=";
   
    
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@/%@/%@", url, _query, @"&entity=software"]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        NSError * err;
        
        NSDictionary * arrayOFJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&err];
        
        
        NSMutableArray<SearchResponse*>* searchResult = [NSMutableArray new];
        
      
//        searchResult arrayByAddingObject:
        NSArray * results = arrayOFJSON[@"results"];
       
      
        
      
        NSLog(@"Search Reponse %@",results);
        
        for (NSDictionary * keys in results ) {


            NSString * trackName = keys[@"trackName"];
            NSString * description = keys[@"description"];
            
            
            NSNumber * numberTrackID = keys[@"trackId"];
            NSString * trackID = [numberTrackID stringValue];
            
            NSLog(@"%@ Track ID", trackID);
            NSString * artworkUrl60 = keys[@"artworkUrl512"];
            

            
            [searchResult addObject:[[SearchResponse alloc] init:trackName theDescription:description trackID:trackID artworkUrl60:artworkUrl60]];

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



@end
