//
//  UploadViewController.swift
//  FirebaseApp
//
//  Created by Muhsin Can Yılmaz on 28.07.2022.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorseeleTiklandi))
        imageGestureRecognizer.numberOfTapsRequired = 2   //Jump to definition :D
        imageView.addGestureRecognizer(imageGestureRecognizer)

        
    }
    
    @objc func gorseeleTiklandi() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
    }
    

    @IBAction func uploadButtonTapped(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageRegerence = mediaFolder.child("\(uuid).jpg")
            
            imageRegerence.putData(data, metadata: nil) { storagemetadata, error in
                if error != nil {
                    self.hataMesajiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata var. Tekrar Deneyiniz")
                }else{
                    imageRegerence.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            if let imageUrl = imageUrl {
                                let firestoreDatabase = Firestore.firestore()
                                
                                let firestorePost = ["gorselurl" : imageUrl,"yorum" : self.commentTextField.text,"email" : Auth.auth().currentUser?.email, "tarih" : FieldValue.serverTimestamp() ] as [String : Any]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) { error in
                                    if error != nil {
                                        self.hataMesajiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata oluştu.")
                                    }else{
                                        
                                        self.commentTextField.text = ""
                                        self.imageView.image = UIImage(systemName: "square.and.pencil")
                                        self.tabBarController?.selectedIndex = 0
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    func hataMesajiGoster(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    

}
