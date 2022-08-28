//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by Muhsin Can Yılmaz on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var kus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselDegistir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func gorselDegistir() {
       
        if kus == false {
            imageView.image = UIImage(named: "kus")
            label.text = "Kuş"
            kus = true
        }else{
            imageView.image = UIImage(named: "baykus")
            label.text = "Baykuş"
            kus = false
        }
        
    }

}

