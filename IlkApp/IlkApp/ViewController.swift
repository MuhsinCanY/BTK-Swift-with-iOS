//
//  ViewController.swift
//  IlkApp
//
//  Created by Muhsin Can Yılmaz on 15.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myclick(_ sender: Any) {
        mylabel.text = "Bulut"
    }
    @IBAction func click(_ sender: Any) {
        mylabel.text = "Sanane"
    }
    
}

