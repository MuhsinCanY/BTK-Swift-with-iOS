//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Muhsin Can Yılmaz on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelZaman: UILabel!
    @IBOutlet weak var LabelIs: UILabel!
    @IBOutlet weak var textFieldTarih: UITextField!
    @IBOutlet weak var textFieldNot: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenTarih = UserDefaults.standard.object(forKey: "tarih")
        
        // as -> casting (kaydedilenNot u String olarak gelenNot a eşitle !!)
        if let gelenNot = kaydedilenNot as? String {
            LabelIs.text = "Yapılacak İş : \(gelenNot)"
            //Any den Stringe çevirme işlemi
        }
        
        if let gelenTarih = kaydedilenTarih as? String {
            LabelZaman.text = "Yapılacak Zaman : \(gelenTarih)"
        }
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        
        UserDefaults.standard.set(textFieldNot.text, forKey: "not")
        UserDefaults.standard.set(textFieldTarih.text, forKey: "tarih")
        
        LabelIs.text = "Yapılacak İş : \(textFieldNot.text!)"
        LabelZaman.text = "Yapılacak Zaman : \(textFieldTarih.text!)"
        
    }
    @IBAction func buttonSil(_ sender: Any) {
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenTarih = UserDefaults.standard.object(forKey: "tarih")
        
        if (kaydedilenNot as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "not")
            LabelIs.text = "Yapılacak İş : "
        }
        if (kaydedilenTarih as? String != nil){
            UserDefaults.standard.removeObject(forKey: "tarih")
            LabelZaman.text = "Yapılacak Zaman :"
        }
        
    }
    
}

