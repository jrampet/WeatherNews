//
//  countries.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 31/05/21.
//

import Foundation
struct Country: Codable {
    let country: String
    let latitude: Double
    let longitude: Double
    let name: String
}

typealias Countries = [Country]
