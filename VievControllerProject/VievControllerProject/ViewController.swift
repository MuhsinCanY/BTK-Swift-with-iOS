//
//  ViewController.swift
//  VievControllerProject
//
//  Created by Muhsin Can Yılmaz on 21.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var Label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kontrolet(_ sender: Any) {
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.gelenSifre = textField.text!
        
        }
        
    }
    
}

