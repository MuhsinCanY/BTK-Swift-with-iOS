//
//  DetailsViewController.swift
//  TableView
//
//  Created by Muhsin Can Yılmaz on 30.06.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var secilenKus = ""
    var secilenKusGorselIsmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: secilenKusGorselIsmi)
        label.text = secilenKus

    }
    

}
