//
//  DetailsViewController.swift
//  ContinentIntroduction
//
//  Created by Muhsin Can Yılmaz on 3.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var continentLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var secilenCountry: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = secilenCountry?.name
        continentLabel.text = secilenCountry?.continent
        imageView.image = secilenCountry?.image
        
    }
    

}
