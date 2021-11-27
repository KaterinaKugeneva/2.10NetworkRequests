//
//  PersonCell.swift
//  2.10NetworkRequests
//
//  Created by Ekaterina Kugeneva on 26.11.2021.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cpeciesLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    
    
    func configure(with person: Person) {
        nameLabel.text = person.name
        cpeciesLabel.text = person.species
        locationLabel.text = person.location.name
        
        
        DispatchQueue.global().async {
            guard let stringURL = person.image else { return }
            guard let url = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.personImage.image = UIImage(data: imageData)
            }
        }
    }
}
