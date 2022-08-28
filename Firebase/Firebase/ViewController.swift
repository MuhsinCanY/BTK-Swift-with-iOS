//
//  ViewController.swift
//  Firebase
//
//  Created by Muhsin Can Yılmaz on 26.07.2022.
//

import UIKit
import Firebase

// Güncel kullanıcı otomatik girişi Scenedelegate içinde tanımlanmıştır.

class ViewController: UIViewController {

    @IBOutlet weak var sifreTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GirisYapButton(_ sender: Any) {
        
        if mailTextField.text != "" && sifreTextField.text != "" {
            
            Auth.auth().signIn(withEmail: mailTextField.text!, password: sifreTextField.text!) { authDataResult, error in
                if error != nil {
                    self.alertFunc(title: "Hata", message: error?.localizedDescription ?? "Hata oluştu." )
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            alertFunc(title: "Hata", message: "Kullanıcı Adı ve Şifre boş olmaz.Lütfen düzgün giriniz.")
        }
        
    }
    @IBAction func KayitOlButton(_ sender: Any) {
        
        if mailTextField.text != "" && sifreTextField.text != "" {
            //Katıt olusturma
            
            Auth.auth().createUser(withEmail: mailTextField.text!, password: sifreTextField.text!) { authDataResult, error in
                if error != nil {
                    self.alertFunc(title: "Hata", message: error?.localizedDescription ?? "Hata oluştu." )
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            alertFunc(title: "Hata", message: "Kullanıcı Adı ve Şifre boş olmaz.Lütfen düzgün giriniz.")
        }
        
    }
    
    func alertFunc(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

