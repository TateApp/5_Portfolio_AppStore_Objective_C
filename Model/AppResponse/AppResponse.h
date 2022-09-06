//
//  AppResponse.h
//  App Store
//
//  Created by Tate Wrigley on 02/09/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppResponse : NSObject

@property NSArray<NSString * >* advisories;
@property NSArray<NSString * >* appletvScreenshotUrls;
@property NSString * artistId;
@property NSString * artistName;
@property NSString * artistViewUrl;
@property NSString * artworkUrl100;
@property NSString * artworkUrl512;
@property NSString * artworkUrl60;
@property NSString * averageUserRating;
@property NSString * averageUserRatingForCurrentVersion;
@property NSString * bundleId;
@property NSString * contentAdvisoryRating;
@property NSString * currency;
@property NSString * currentVersionReleaseDate;
@property NSString * theDescription;
@property NSArray<NSString * > * features;
@property NSString * fileSizeBytes;
@property NSString * formattedPrice;

@property NSArray<NSString * > * genreIds;
@property NSArray<NSString * > * genres;
@property NSArray<NSString * > * ipadScreenshotUrls;
@property NSString * isGameCenterEnabled;
@property NSString * isVppDeviceBasedLicensingEnabled;
@property NSString * kind;
@property NSString * languageCodesISO2A;
@property NSString * minimumOsVersion;
@property NSString * price;
@property NSString * primaryGenreId;
@property NSString * primaryGenreName;
@property NSString * releaseDate;
@property NSString * releaseNotes;
@property NSArray<NSString * > * screenshotUrls;
@property NSString * sellerName;
@property NSArray<NSString * > * supportedDevices;
@property NSString * trackCensoredName;
@property NSString * trackContentRating;
@property NSString * trackId;
@property NSString * trackName;
@property NSString * trackViewUrl;
@property NSString * userRatingCount;
@property NSString * userRatingCountForCurrentVersion;
@property NSString * version;
@property NSString * wrapperType;

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
wrapperType: (NSString *) wrapperType;

@end

NS_ASSUME_NONNULL_END
