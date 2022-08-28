//
//  ViewController.swift
//  AlisverisListesi
//
//  Created by Muhsin Can Yılmaz on 4.07.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var isimDizisi = [String]()
    var idDizisi = [UUID]()
    var secilenIsim = ""
    var secilenUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // navigationController a add buttonu manuel olarak ekleme
        //navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButtonuTiklandi))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButtonuTiklandi))
        self.title = "Alışveriş"
        //self.navigationItem.title = "Alışveriş"
        
        verileriAl()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(verileriAl), name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
    }
    
    @objc func verileriAl() {
        
        isimDizisi.removeAll()
        idDizisi.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fecthRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Alisveris")
        fecthRequest.returnsObjectsAsFaults = false  //Buyuk verilerle calısırken kullanıslı
        
        do{
            let sonuclar = try context.fetch(fecthRequest)
            if sonuclar.count > 0 {
                for sonuc in sonuclar as! [NSManagedObject] {
                    if let isim = sonuc.value(forKey: "isim") as? String {
                        isimDizisi.append(isim)
                    }
                    if let id = sonuc.value(forKey: "id") as? UUID {
                        idDizisi.append(id)
                    }
                    tableView.reloadData() //Dataları güncellemek için
                }
            }
            }
            catch {
            print("hata oldu")
        }
    }

    @objc func eklemeButtonuTiklandi() {
        secilenIsim = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
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
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenUrunIsim = secilenIsim
            destinationVC.secilenUrunUUID = secilenUUID
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = isimDizisi[indexPath.row]
        secilenUUID = idDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
            let idString = idDizisi[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate.init(format: "id = %@", idString)
            
            do{
                let sonuclar = try context.fetch(fetchRequest)
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let id = sonuc.value(forKey: "id") as? UUID {
                        if id == idDizisi[indexPath.row]{
                            isimDizisi.remove(at: indexPath.row)
                            idDizisi.remove(at: indexPath.row)
                            context.delete(sonuc)
                            tableView.reloadData()
                        }
                        
                    }
                    do{
                        try context.save()
                    }catch{
                        
                    }
                    break
                }
            }catch{
                
            }
            
            
        }
    }
}

