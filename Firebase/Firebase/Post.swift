//
//  Post.swift
//  FirebaseApp
//
//  Created by Muhsin Can Yılmaz on 4.08.2022.
//

import Foundation

class Post {
    
    var email : String
    var yorum : String
    var gorselurl : String
    
    init(email: String , yorum: String , gorselurl: String){
        self.email = email
        self.yorum = yorum
        self.gorselurl = gorselurl
    }
    
}
