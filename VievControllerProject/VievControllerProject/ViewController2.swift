//
//  ViewController2.swift
//  VievControllerProject
//
//  Created by Muhsin Can Yılmaz on 21.06.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var bulunanSifreLabel: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    
    var gelenSifre = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bulunanSifreLabel.text = gelenSifre
    }
    
}
