//
//  PriviteUser.swift
//  SwiftOOP
//
//  Created by Muhsin Can Yılmaz on 2.07.2022.
//

import Foundation


//inheritance
class PrivateUser : User {
    override func OrnekFonksiyon() {
        print("PrivateUser örnek fonksiyon çalıstırıldı")
    }
    
    func YeniFonksiyon() {
        print("yenifonksiyon çalıştı")
    }
    
}
