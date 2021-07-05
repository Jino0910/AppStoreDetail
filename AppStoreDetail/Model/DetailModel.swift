//
//  DetailModel.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Codable {
    let resultCount: Int
    let results: [Result]
    
    // MARK: - Result
    struct Result: Codable {
        let screenshotUrls: [String]
        let ipadScreenshotUrls, appletvScreenshotUrls: [String?]
        let artworkUrl512: String
        let artistViewURL: String
        let artworkUrl60, artworkUrl100: String
        let supportedDevices: [String]
        let isGameCenterEnabled: Bool
        let advisories, features: [String?]
        let kind, minimumOSVersion: String
        let languageCodesISO2A: [String]
        let fileSizeBytes, formattedPrice: String
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
        let releaseNotes: String
        let primaryGenreID: Int
        let currency, resultDescription: String
        let artistID: Int
        let artistName: String
        let genres: [String]
        let price: Int
        let bundleID, version, wrapperType: String
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

}
