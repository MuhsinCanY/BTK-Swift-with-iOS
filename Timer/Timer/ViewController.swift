//
//  ViewController.swift
//  Timer
//
//  Created by Muhsin Can Yılmaz on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var kalanZaman = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func baslatTıklandı(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunc() {
        
        label.text = "Kalan Süre : \(kalanZaman)"
        kalanZaman -= 1
        if kalanZaman == 0{
            label.text = "Süre Bitti..."
            timer.invalidate()
            kalanZaman = 5
        }
        
    }
    
}

