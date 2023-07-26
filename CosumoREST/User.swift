//
//  User.swift
//  CosumoREST
//
//  Created by Salvador Lopez on 26/07/23.
//

import Foundation

class User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

class Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

class Geo: Codable {
    let lat, lng: String?
}

class Company: Codable {
    let name, catchPhrase, bs: String?
}
