//
//  Country.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import Foundation

struct CountriesResponse: Codable {
    var countries: [Country]?
}

struct Country: Codable {
    let name: String
    let topLevelDomain: [String]?
    let alpha2Code, alpha3Code: String?
    let callingCodes: [String]?
    let capital: String?
    let altSpellings: [String]?
    let region, subregion: String
    let population: Int?
    let latlng: [Double]?
    let demonym: String?
    let area, gini: Double?
    let timezones, borders: [String]?
    let nativeName, numericCode: String?
    let currencies: [Currency]?
    let languages: [Language]?
    let translations: Translations?
    let flag: String?
    let regionalBlocs: [RegionalBloc]?
    let cioc: String?
}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String?
}

// MARK: - Language
struct Language: Codable {
    let iso6391, iso6392, name, nativeName: String?
}

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym, name: String?
    let otherAcronyms: [String?]?
    let otherNames: [String]?
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String?
    let it, br, pt, nl: String?
    let hr, fa: String?
}
