//
//  DetailsViewController.swift
//  AlisverisListesi
//
//  Created by Muhsin Can Yılmaz on 4.07.2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var kaydetButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var bedenTextField: UITextField!
    
    var secilenUrunIsim: String = ""
    var secilenUrunUUID: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsim != "" {
            
            kaydetButton.isHidden = true
            
            //Core Data'dan urun bilgilrini getirme
            if let uuidString = secilenUrunUUID?.uuidString {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchReques = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchReques.predicate = NSPredicate.init(format: "id = %@", uuidString)
                fetchReques.returnsObjectsAsFaults = false
                
                do{
                    let sonuclar = try context.fetch(fetchReques) as! [NSManagedObject]
                    for sonuc in sonuclar {
                        if let isim = sonuc.value(forKey: "isim") as? String{
                            isimTextField.text = isim
                        }
                        if let fiyat = sonuc.value(forKey: "fiyat") as? Int{
                            fiyatTextField.text = String(fiyat)
                        }
                        if let beden = sonuc.value(forKey: "beden") as? String{
                            bedenTextField.text = beden
                        }
                        if let image = sonuc.value(forKey: "gorsel") as? Data{
                            let gorsel = UIImage(data: image)
                            imageView.image = gorsel
                        }
                        
                    }
                }catch{
                    
                }
                
            }
            
        }else{
            kaydetButton.isHidden = false
            kaydetButton.isEnabled = false
            isimTextField.text = ""
            fiyatTextField.text = ""
            bedenTextField.text = ""
            }
        
        
        // view de boş alana tıklayınca keyboard kapatma
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorseeleTiklandi))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @objc func gorseeleTiklandi() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        //picker.allowsEditing = true
        kaydetButton.isEnabled = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    // info privacy ayarları ile library e erişim izini alınması
    
    @IBAction func kaydetButtonTiklandi(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(isimTextField.text, forKey: "isim")
        alisveris.setValue(bedenTextField.text, forKey: "beden")
        
        if let fiyat = Int(fiyatTextField.text!) {
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        
        do {
            try context.save()
            print("kayıt edildi")
        }catch{
            print("hata var")
        }
        NotificationCenter.default.post(name: NSNotification.Name("veriGirildi"), object: nil)
        
        navigationController?.popViewController(animated: true)
    }
    
}
