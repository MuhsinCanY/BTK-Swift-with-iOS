//
//  Sehir.swift
//  SehirTanitim
//
//  Created by Muhsin Can Yılmaz on 2.07.2022.
//

import Foundation
import UIKit

class Sehir {
    var isim : String
    var bolge : String
    var resim : UIImage
    
    init(isim: String, bolge: String , resim: UIImage) {
        self.isim = isim
        self.bolge = bolge
        self.resim = resim
    }
    
}
