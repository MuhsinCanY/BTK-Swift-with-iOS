//
//  ViewController.swift
//  AlertTest
//
//  Created by Muhsin Can Yılmaz on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressButton(_ sender: Any) {
        if textField.text == ""{
            let alert = UIAlertController(title: "Alert", message: "ERROR", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            //alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.") }))
            present(alert, animated: true)
        }
    }
    
}

