//
//  DetailsViewController.swift
//  Manzara
//
//  Created by Muhsin Can Yılmaz on 13.07.2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var kaydetButton: UIButton!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var secilenUrunIsim: String = ""
    var secilenUrunUUID: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsim != ""{
            kaydetButton.isHidden = true
            // coredata verileri getir
            if let secilenUUID = secilenUrunUUID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Manzara")
                fetchRequest.predicate = NSPredicate(format: "id = %@", secilenUUID)
                
                do{
                    let sonuclar = try context.fetch(fetchRequest)
                    for sonuc in sonuclar as! [NSManagedObject]{
                        if let isim = sonuc.value(forKey: "isim") as? String{
                            isimTextField.text = isim
                        }
                        
                        if let resim = sonuc.value(forKey: "image") as? Data{
                            let image = UIImage(data: resim)
                            imageView.image = image
                        }
                        
                    }
                }catch{
                    print("hata")
                }
                
            }
    
        }else{
            kaydetButton.isHidden = false
            kaydetButton.isEnabled = false
            isimTextField.text = ""
        }
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func tapImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        kaydetButton.isEnabled = true
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let manzara = NSEntityDescription.insertNewObject(forEntityName: "Manzara", into: context)
        
        manzara.setValue(isimTextField.text!, forKey: "isim")
        manzara.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        manzara.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("kaydedildi")
        }catch{
            print("hata")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
        navigationController?.popViewController(animated: true)
        
    }
    

}
