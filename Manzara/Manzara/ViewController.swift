//
//  ViewController.swift
//  Manzara
//
//  Created by Muhsin Can Yılmaz on 13.07.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var isimDizisi: [String] = []
    var uuidDizisi = [UUID()]
    var secilenIsim = ""
    var secilenUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dataFetch()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonAddItem))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(dataFetch), name: NSNotification.Name?(NSNotification.Name(rawValue: "veriGirildi")), object: nil)
    }
    
    @objc func dataFetch(){
        
        isimDizisi.removeAll()
        uuidDizisi.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Manzara")
        
        do{
            let sonuclar = try context.fetch(fetchRequest) as! [NSManagedObject]
            for sonuc in sonuclar {
                let isim = sonuc.value(forKey: "isim") as! String
                isimDizisi.append(isim)
                
                let uuid = sonuc.value(forKey: "id") as! UUID
                uuidDizisi.append(uuid)
                
            }
        }catch{
            print("hata")
        }
        tableView.reloadData()
        
    }

    @objc func rightButtonAddItem() {
        secilenIsim = ""
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenUrunIsim = secilenIsim
            destinationVC.secilenUrunUUID = secilenUUID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = isimDizisi[indexPath.row]
        secilenUUID = uuidDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Manzara")
            let idString = uuidDizisi[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            do{
                let sonuclar = try context.fetch(fetchRequest)
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let id = sonuc.value(forKey: "id") as? UUID {
                        if id == uuidDizisi[indexPath.row] {
                            context.delete(sonuc)
                            uuidDizisi.remove(at: indexPath.row)
                            isimDizisi.remove(at: indexPath.row)
                            
                            self.tableView.reloadData()
                            
                            do{
                                try context.save()
                            }catch{
                                
                            }
                            break
                        }
                    }
                    
                }
            }catch{
                
            }
            
        }
    }

}

