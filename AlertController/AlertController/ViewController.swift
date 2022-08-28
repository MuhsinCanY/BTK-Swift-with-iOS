//
//  ViewController.swift
//  AlertController
//
//  Created by Muhsin Can Yılmaz on 28.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singUpButton(_ sender: Any) {
        
        if mailTextField.text == ""{
            alertOlustur(GirilenTitle: "Hata", GirilenMessage: "e-mail girilmedi")
        } else if passwordTextField.text == ""{
            alertOlustur(GirilenTitle: "Hata", GirilenMessage: "password girilmedi")
        } else if passwordTextField.text != password2TextField.text{
            alertOlustur(GirilenTitle: "Hata", GirilenMessage: "password uyuşmadı")
        } else {
            alertOlustur(GirilenTitle: "Tebrikler", GirilenMessage: "Hesap Oluşturuldu")
        }
        
    }
    
    func alertOlustur (GirilenTitle : String, GirilenMessage : String){
        let uyariMesaji = UIAlertController(title: GirilenTitle, message: GirilenMessage, preferredStyle: UIAlertController.Style.alert)

        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
        }
        
        uyariMesaji.addAction(okButton)
        
        self.present(uyariMesaji, animated: true)
    }
    
}

