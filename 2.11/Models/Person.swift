//
//  Person.swift
//  2.10NetworkRequests
//
//  Created by Ekaterina Kugeneva on 26.11.2021.
//

struct Person: Decodable {
    let name: String
    let image: String?
    let species: String
    let location: Location
}


struct Location: Decodable {
    let name: String
    let url: String
}

struct WebInformation: Decodable {
    let info: Info
    let results: [Person]
}

struct Info: Decodable {
    let next: String?
    let prev: String?
    
}
