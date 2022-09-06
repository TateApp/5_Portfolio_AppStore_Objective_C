//
//  AppResponse.m
//  App Store
//
//  Created by Tate Wrigley on 02/09/2022.
//

#import "AppResponse.h"

@implementation AppResponse


- (instancetype)
init :(NSArray<NSString * >*) advisories
appletvScreenshotUrls: (NSArray<NSString * >*) appletvScreenshotUrls
artistId: (NSString *) artistId
artistName: (NSString *) artistName
artistViewUrl: (NSString *) artistViewUrl
artworkUrl100: (NSString *) artworkUrl100
artworkUrl512: (NSString *) artworkUrl512
artworkUrl60: (NSString *) artworkUrl60
averageUserRating: (NSString *) averageUserRating
averageUserRatingForCurrentVersion: (NSString *) averageUserRatingForCurrentVersion
bundleId: (NSString *) bundleId
contentAdvisoryRating: (NSString *) contentAdvisoryRating
currency: (NSString *) currency
currentVersionReleaseDate: (NSString *) currentVersionReleaseDate
theDescription: (NSString *) theDescription
features: (NSArray<NSString * > *) features
fileSizeBytes: (NSString *) fileSizeBytes
formattedPrice: (NSString *) formattedPrice

genreIds: (NSArray<NSString * > *) genreIds
genres: (NSArray<NSString * > *) genres
ipadScreenshotUrls:(NSArray<NSString * > *) ipadScreenshotUrls
isGameCenterEnabled: (NSString *) isGameCenterEnabled
isVppDeviceBasedLicensingEnabled: (NSString *) isVppDeviceBasedLicensingEnabled
kind: (NSString *) kind
languageCodesISO2A: (NSString *) languageCodesISO2A
minimumOsVersion: (NSString *) minimumOsVersion
price: (NSString *) price
primaryGenreId: (NSString *) primaryGenreId
primaryGenreName: (NSString *) primaryGenreName
releaseDate: (NSString *) releaseDate
releaseNotes: (NSString *) releaseNotes
screenshotUrls: (NSArray<NSString * > *) screenshotUrls
sellerName: (NSString *) sellerName
supportedDevices: (NSArray<NSString * > *) supportedDevices
trackCensoredName: (NSString *) trackCensoredName
trackContentRating: (NSString *) trackContentRating
trackId: (NSString *) trackId
trackName: (NSString *) trackName
trackViewUrl: (NSString *) trackViewUrl
userRatingCount: (NSString *) userRatingCount
userRatingCountForCurrentVersion: (NSString *) userRatingCountForCurrentVersion
version: (NSString *) version
wrapperType: (NSString *) wrapperType {
    
    self = [super init];
    
    if (self) {
    
        self.advisories = advisories;
        self.appletvScreenshotUrls = appletvScreenshotUrls;
        self. artistId = artistId;
        self.artistName = artistName;
        self.artistViewUrl = artistViewUrl;
        self.artworkUrl100 = artworkUrl100;
        self.artworkUrl512 = artworkUrl512;
        self.artworkUrl60 = artworkUrl60;
        self.averageUserRating = averageUserRating;
        self.averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion;
        self.bundleId = bundleId;
        self.contentAdvisoryRating = contentAdvisoryRating;
        self.currency = currency;
        self.currentVersionReleaseDate = currentVersionReleaseDate;
        self.theDescription = theDescription;
        self.features = features;
        self.fileSizeBytes = fileSizeBytes;
        self.formattedPrice = formattedPrice;

        self.genreIds = genreIds;
        self.genres = genres;
        self.ipadScreenshotUrls = ipadScreenshotUrls;
        self.isGameCenterEnabled = isGameCenterEnabled;
        self.isVppDeviceBasedLicensingEnabled = isVppDeviceBasedLicensingEnabled;
        self.kind = kind;
        self.languageCodesISO2A = languageCodesISO2A;
        self.minimumOsVersion = minimumOsVersion;
        self.price = price;
        self.primaryGenreId = primaryGenreId;
        self.primaryGenreName = primaryGenreName;
        self.releaseDate = releaseDate;
        self.releaseNotes = releaseNotes;
        self.screenshotUrls = screenshotUrls;
        self.sellerName = sellerName;
        self.supportedDevices = supportedDevices;
        self.trackCensoredName = trackCensoredName;
        self.trackContentRating = trackContentRating;
        self.trackId = trackId;
        self.trackName = trackName;
        self.trackViewUrl = trackViewUrl;
        self.userRatingCount = userRatingCount;
        self.userRatingCountForCurrentVersion = userRatingCountForCurrentVersion;
        self.version = version;
        self.wrapperType = wrapperType;
        
        
    }
    
    return self;
    
}

@end
