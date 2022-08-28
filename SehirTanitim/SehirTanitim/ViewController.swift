//
//  ViewController.swift
//  SehirTanitim
//
//  Created by Muhsin Can Yılmaz on 2.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableWiev: UITableView!
    
    var kullaniciSecimi : Sehir?
    var sehirDizisi = [Sehir]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableWiev.delegate = self
        tableWiev.dataSource = self
        
        let ankara = Sehir(isim: "Ankara", bolge: "İç Anadolu", resim: UIImage(named: "ankara")!)
        let istanbul = Sehir(isim: "İstanbul", bolge: "Marmara", resim: UIImage(named: "istanbul")!)
        
        sehirDizisi = [ankara,istanbul]
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
            
        }
    }
    
}

