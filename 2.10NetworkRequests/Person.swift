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
    init (_ name: String, _ image: String, _ species: String, _ location: Location) {
        self.name   = name
        self.species = species
        self.image = image
        self.location = location
    }
    
    
}


struct Location: Decodable {
    let name: String
    let url: String
    
    init (_ name: String, _ url: String){
        self.name   = name
        self.url = url
    }
    
}
