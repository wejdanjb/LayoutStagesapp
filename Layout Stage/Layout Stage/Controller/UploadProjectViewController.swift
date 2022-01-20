//
//  UploadProjectViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 14/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadProjectViewController: UIViewController {
    let imagePicker = UIImagePickerController()
   
  // 1 create a UNIUQ name
    let db = Firestore.firestore()
    
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    @IBAction func choosePhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadImg(_ sender: Any) {
       
        let imageName = "\(UUID().uuidString)"
        let imagesFolder = Storage.storage().reference().child("images/\(imageName).png")// create a folder called images
        if let imageData = imageview.image?.jpegData(compressionQuality: 0.1) // 2 Convert our UIImage into spme data
        {
            imagesFolder.putData(imageData, metadata: nil) { (metaData, error) in
                if let error = error{
                    print(error.localizedDescription)
                }else {
                    imagesFolder.downloadURL { imageURL, error in
                        if error == nil {
                            var userId = Auth.auth().currentUser?.uid
                            let postID = "\(UUID().uuidString)"
                            let dataSend = [
                                "userID" : userId!,
                                "imgURL" : "\(imageURL!)",
                                "postDate": Date(),
                                "postID": postID,
                            ] as [String : Any]
                            print("Upload done")
                            self.db.collection("Eng").document(userId!).collection("Posts").document(postID).setData(dataSend)
                            self.db.collection("Posts").document(postID).setData(dataSend)
                            
                        }
                        
                    }
                    
                }
            }
            
        }
        let alert = UIAlertController(title: "تم اضافة الصورة", message: "بامكانك اضافة المزيد", preferredStyle: .alert)
        let action = UIAlertAction(title: "حسناً", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

    }
    override var prefersStatusBarHidden: Bool {
        return true
      }
    
    @IBAction func uoloadclouse(_ sender: Any) {
        let go = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        go!.modalPresentationStyle = .fullScreen
        self.present(go!, animated: true, completion: nil)
       
    }
    

}


extension UploadProjectViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageview.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
}

