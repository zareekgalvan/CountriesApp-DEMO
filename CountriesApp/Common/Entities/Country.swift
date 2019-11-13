//
//  Country.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import Foundation
import MapKit

class CountryAnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

class Country: NSObject, Codable {
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
    let flag: String
    let regionalBlocs: [RegionalBloc]?
    let cioc: String?
}

// MARK: - Currency
class Currency: NSObject, Codable {
    let code, name, symbol: String?
}

// MARK: - Language
class Language: NSObject, Codable {
    let iso6391, iso6392, name, nativeName: String?
}

// MARK: - RegionalBloc
class RegionalBloc: NSObject, Codable {
    let acronym, name: String?
    let otherAcronyms: [String?]?
    let otherNames: [String]?
}

// MARK: - Translations
class Translations: NSObject, Codable {
    let de, es, fr, ja: String?
    let it, br, pt, nl: String?
    let hr, fa: String?
    var translations: [String] {
        get {
            var trans = [String]()
            if let de = de {
                trans.append("German: \(de)")
            }
            if let es = es {
                trans.append("Spanish: \(es)")
            }
            if let fr = fr {
                trans.append("French: \(fr)")
            }
            if let ja = ja {
                trans.append("Japanese: \(ja)")
            }
            if let it = it {
                trans.append("Italian: \(it)")
            }
            if let br = br {
                trans.append("Portuguese (Brazil): \(br)")
            }
            if let pt = pt {
                trans.append("Portuguese (Portugal): \(pt)")
            }
            if let nl = nl {
                trans.append("Dutch: \(nl)")
            }
            if let hr = hr {
                trans.append("Croatian: \(hr)")
            }
            if let fa = fa {
                trans.append("Farsi: \(fa)")
            }
            
            return trans
        }
    }
    
}
