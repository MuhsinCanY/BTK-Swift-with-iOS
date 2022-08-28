//
//  FeedViewController.swift
//  FirebaseApp
//
//  Created by Muhsin Can Yılmaz on 28.07.2022.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var postDizisi = [Post]()
    
    //var emailDizisi = [String]()
    //var gorselDizisi = [String]()
    //var yorumDizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        firebaseVerileriGetir()
        
    }
    
    func firebaseVerileriGetir() {
        let fireStoneDatabase = Firestore.firestore()
        
        //.whereField("email", isEqualTo: "muhsin@gmail.çöm")
        
        fireStoneDatabase.collection("Post").order(by: "tarih", descending: true)
            .addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.postDizisi.removeAll()
                    
                    //self.emailDizisi.removeAll()
                    //self.gorselDizisi.removeAll()
                    //self.yorumDizisi.removeAll()
                    
                    for document in snapshot!.documents {
                        //let documentID = document.documentID
                        
                        if let email = document.get("email") as? String {
                            //self.emailDizisi.append(email)
                            if let yorum = document.get("yorum") as? String {
                                //self.yorumDizisi.append(yorum)
                                if let gorselurl = document.get("gorselurl") as? String{
                                    //self.gorselDizisi.append(gorselurl)
                                    
                                    let post = Post(email: email, yorum: yorum, gorselurl: gorselurl)
                                    self.postDizisi.append(post)
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        //cell.emailLabel.text = emailDizisi[indexPath.row]
        //cell.postİmageView.sd_setImage(with: URL(string: gorselDizisi[indexPath.row]))
        //cell.yorumLabel.text = yorumDizisi[indexPath.row]
        cell.emailLabel.text = postDizisi[indexPath.row].email
        cell.postİmageView.sd_setImage(with: URL(string: postDizisi[indexPath.row].gorselurl))
        cell.yorumLabel.text = postDizisi[indexPath.row].yorum
        return cell
    }


}
