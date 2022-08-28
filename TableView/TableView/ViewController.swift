//
//  ViewController.swift
//  TableView
//
//  Created by Muhsin Can Yılmaz on 30.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    var kusIsımleri = [String]()
    var kusResmiIsimleri = [String]()
    
    var secilenIsım = ""
    var secilenGorselIsım = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        
        kusIsımleri.append("Kuş")
        kusIsımleri.append("Baykuş")
        kusIsımleri.append("Kuşkonmaz")
        kusIsımleri.append("Hürkuş")
        
        kusResmiIsimleri.append("kus")
        kusResmiIsimleri.append("baykus")
        kusResmiIsimleri.append("kuskonmaz")
        kusResmiIsimleri.append("hurkus")
        
    }
    
    //numberOfRowsInSection
    //cellForRowAt

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kusIsımleri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = UITableViewCell()
        table.textLabel?.text = kusIsımleri[indexPath.row]
        return table
    }
    
    /*private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowat indexpath: IndexPath){
        if editingStyle == .delete{
            kusIsımleri.remove(at: indexpath.row)
            kusResmiIsimleri.remove(at: indexpath.row)
            tableView.deleteRows(at: [indexpath], with: UITableView.RowAnimation.fade)
        }
    } */
    
    
    //Deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        self.kusIsımleri.remove(at: indexPath.row)
          self.kusResmiIsimleri.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
      }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsım = kusIsımleri[indexPath.row]
        secilenGorselIsım = kusResmiIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKus = secilenIsım
            destinationVC.secilenKusGorselIsmi = secilenGorselIsım
        }
        
    }
    
}

