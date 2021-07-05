//
//  DetailModel.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation
import RxDataSources

// MARK: - DetailModel
struct DetailModel: Codable {
    let resultCount: Int
    let results: [Result]
    
    // MARK: - Result
    struct Result: Codable {
        let screenshotUrls: [String]  //
        let ipadScreenshotUrls, appletvScreenshotUrls: [String?]
        let artworkUrl512: String
        let artistViewURL: String
        let artworkUrl60, artworkUrl100: String
        let supportedDevices: [String]
        let isGameCenterEnabled: Bool
        let advisories, features: [String?]
        let kind, minimumOSVersion: String
        let languageCodesISO2A: [String]
        let fileSizeBytes, formattedPrice: String //
        let averageUserRatingForCurrentVersion: Double
        let userRatingCountForCurrentVersion: Int
        let trackContentRating, trackCensoredName: String
        let trackViewURL: String
        let contentAdvisoryRating: String
        let averageUserRating: Double
        let genreIDS: [String]
        let releaseDate: String
        let trackID: Int
        let trackName, sellerName, primaryGenreName: String
        let isVppDeviceBasedLicensingEnabled: Bool
        let currentVersionReleaseDate: String
        let releaseNotes: String //
        let primaryGenreID: Int
        let currency, resultDescription: String //
        let artistID: Int
        let artistName: String
        let genres: [String] //
        let price: Int
        let bundleID, version, wrapperType: String //
        let userRatingCount: Int

        enum CodingKeys: String, CodingKey {
            case screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl512
            case artistViewURL = "artistViewUrl"
            case artworkUrl60, artworkUrl100, supportedDevices, isGameCenterEnabled, advisories, features, kind
            case minimumOSVersion = "minimumOsVersion"
            case languageCodesISO2A, fileSizeBytes, formattedPrice, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, trackContentRating, trackCensoredName
            case trackViewURL = "trackViewUrl"
            case contentAdvisoryRating, averageUserRating
            case genreIDS = "genreIds"
            case releaseDate
            case trackID = "trackId"
            case trackName, sellerName, primaryGenreName, isVppDeviceBasedLicensingEnabled, currentVersionReleaseDate, releaseNotes
            case primaryGenreID = "primaryGenreId"
            case currency
            case resultDescription = "description"
            case artistID = "artistId"
            case artistName, genres, price
            case bundleID = "bundleId"
            case version, wrapperType, userRatingCount
        }
    }
    
    var screenshotUrls: [String] {
        self.results.first?.screenshotUrls ?? []
    }
    
    var fileSizeBytes: String {
        self.results.first?.fileSizeBytes ?? ""
    }
    
    var version: String {
        self.results.first?.version ?? ""
    }
    
    var releaseNotes: String {
        self.results.first?.releaseNotes ?? ""
    }
    
    var description: String {
        self.results.first?.resultDescription ?? ""
    }
    
    var genres: [String] {
        self.results.first?.genres ?? []
    }
}

enum AppStoreSectionType: Equatable {
    case detailScreenShot
    case detailDesignatedInfo
    case detailDescription
    case detailCategory
}

struct AppStoreBaseItemSection: IdentifiableType {
    typealias Identity = Int
    var identity: Int {
        return 0
    }
    var items: [AppStoreBaseItem]
}
extension AppStoreBaseItemSection: SectionModelType {
    typealias Item = AppStoreBaseItem
    
    init(original: AppStoreBaseItemSection, items: [Item]) {
        self = original
        self.items = items
    }
    
    static func == (lhs: AppStoreBaseItemSection, rhs: AppStoreBaseItemSection) -> Bool {
        return false
    }
}

struct AppStoreBaseItem {
    
    let type: AppStoreSectionType
    let model: DetailModel
    
    init(type: AppStoreSectionType, model: DetailModel) {
        self.type = type
        self.model = model
    }
}
