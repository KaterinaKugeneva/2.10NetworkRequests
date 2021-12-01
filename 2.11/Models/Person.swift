//
//  Person.swift
//  2.10NetworkRequests
//
//  Created by Ekaterina Kugeneva on 26.11.2021.
//

struct Person: Decodable {
    let name: String?
    let image: String?
    let species: String?
    let location: Location
    
    init(characterData: [String: Any], personLocation: Location ) {
        name = characterData["name"] as? String
        image = characterData["image"] as? String
        species = characterData["species"] as? String
        location = personLocation
    }
}


struct Location: Decodable {
    let name: String?
    let url: String?
    
    init(location: [String: Any]) {
        name = location["name"] as? String
        url = location["url"] as? String
        
    }
}

struct WebInformation: Decodable {
    let info: Info
    let results: [Person]
}

struct Info: Decodable {
    let next: String?
    let prev: String?
    
    init(infoData: [String: Any]) {
        next = infoData["next"] as? String
        prev = infoData["prev"] as? String
    }
    
}
