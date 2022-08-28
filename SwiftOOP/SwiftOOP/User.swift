//
//  User.swift
//  SwiftOOP
//
//  Created by Muhsin Can Yılmaz on 2.07.2022.
//

import Foundation

enum Rank {
    case Admin
    case Normal
}

class User {
    
    var name : String
    var age : Int
    var job : String
    var rank : Rank
    
    // initilizer
    
    init(name: String, age: Int, job: String, rank: Rank) {
        print("init çağırıldı")
        self.name = name
        self.age = age
        self.job = job
        self.rank = rank
    }
    
    func OrnekFonksiyon() {
        print("user örnek fonksiyon çalıştırıldı")
    }
    
}
