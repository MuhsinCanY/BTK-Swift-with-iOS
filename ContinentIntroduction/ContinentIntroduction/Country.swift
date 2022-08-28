//
//  Country.swift
//  ContinentIntroduction
//
//  Created by Muhsin Can Yılmaz on 3.07.2022.
//

import Foundation
import UIKit

class Country {
    var name: String
    var continent: String
    var image = UIImage()
    
    init(name: String, continent: String, image: UIImage) {
        self.name = name
        self.continent = continent
        self.image = image
    }
    
}
