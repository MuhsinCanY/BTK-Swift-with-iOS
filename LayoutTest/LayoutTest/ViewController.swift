//
//  ViewController.swift
//  LayoutTest
//
//  Created by Muhsin Can Yılmaz on 20.06.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
    
        
        // Label
        let myLabel = UILabel()
        
        myLabel.text =  "Test Label"
        myLabel.textAlignment = .center
        //myLabel.frame = CGRect(x: width*0.5, y: height*0.5, width: 100, height: 100)
        //myLabel.frame = CGRect(x: width*0.5, y: height*0.5, width: width*0.8, height: 60)
        //myLabel.frame = CGRect(x: width*0.5-50, y: height*0.5-50, width: 100, height: 100)
        myLabel.frame = CGRect(x: width*0.5-width*0.8/2, y: height*0.5-30, width: width*0.8, height: 60)
        view.addSubview(myLabel)
        
        
        // Button
        
        let myButton = UIButton()
        myButton.setTitle("Test Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width*0.5-50, y: height*0.65-50, width: 100, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myfunc), for: UIControl.Event.touchUpInside)
        
        
    }

    
    @objc func myfunc(){
        print("buton'a tıkladınız")
    }

}

