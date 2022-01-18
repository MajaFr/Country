//
//  Country.swift
//  Country
//
//  Created by Marzena Frąk on 06/01/2022.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String?
    let region: String
    let regionalBlocs: [RegionalBlocs]?
    let population: Double
    let area: Double?
    let languages: [Languages]?
    let timezones: [String]
    let currencies: [Currencies]?
    let flags: FlagsImage
    
}

struct RegionalBlocs: Decodable {
    let acronym: String?
    let name: String?
    let otherNames: [String]?
}

struct Languages: Decodable {
    let name: String
}

struct Currencies: Decodable {
    let name: String?
}

struct FlagsImage: Decodable {
    let png: String?
}


