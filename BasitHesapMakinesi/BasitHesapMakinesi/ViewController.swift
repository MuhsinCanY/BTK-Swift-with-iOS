//
//  ViewController.swift
//  BasitHesapMakinesi
//
//  Created by Muhsin Can Yılmaz on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ilkSayi: UITextField!
    @IBOutlet weak var ikinciSayi: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func toplama(_ sender: Any) {
        if let birinci = Int(ilkSayi.text!) {
            if let ikinci = Int(ikinciSayi.text!) {
                sonuc = birinci + ikinci
                sonucLabel.text = String(sonuc)
            }
        }
    }
    
    @IBAction func cıkartma(_ sender: Any) { if let birinci = Int(ilkSayi.text!) {
        if let ikinci = Int(ikinciSayi.text!) {
            sonuc = birinci - ikinci
            sonucLabel.text = String(sonuc)
        }
    }
        
    }
    
    @IBAction func carpma(_ sender: Any) {
        if let birinci = Int(ilkSayi.text!) {
            if let ikinci = Int(ikinciSayi.text!) {
                sonuc = birinci * ikinci
                sonucLabel.text = String(sonuc)
            }
        }
    }
    
    @IBAction func bolme(_ sender: Any) {
        if let birinci = Int(ilkSayi.text!) {
            if let ikinci = Int(ikinciSayi.text!) {
                sonuc = birinci / ikinci
                sonucLabel.text = String(sonuc)
            }
        }
    }
}

