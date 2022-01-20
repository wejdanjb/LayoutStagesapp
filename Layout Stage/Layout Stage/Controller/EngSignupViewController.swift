//
//  EngSignupViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 29/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class EngSignupViewController: UIViewController {
   
    let db = Firestore.firestore()
    let imagePicker = UIImagePickerController()
    var imageName = "\(UUID().uuidString).png"
    
    @IBOutlet weak var vieweng: UITextView!
    
    @IBOutlet weak var engName: UITextField!
    
    @IBOutlet weak var engEmail: UITextField!
    
    @IBOutlet weak var engPassword: UITextField!
    
    @IBOutlet weak var engDescription: UITextView!
    
    @IBOutlet weak var engPlace: UITextField!
    
    
    @IBOutlet weak var editPhoto: UIButton!
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var engcontact: UITextField!
    
    var toBeUploaded : UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engDescription.layer.cornerRadius = 20
        imagePicker.delegate = self
        
    }
    
    @objc func addPhotoAction() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func editphoto(_ sender: Any) {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .photoLibrary
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    
    @IBAction func engSignup(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: engEmail.text!, password: engPassword.text!) { result, error in
            if let error = error{
                print("error while creating user")
                print(error.localizedDescription)
                
            }else{
                
                let data : [String: Any] = ["Name":self.engName.text!,"email":self.engEmail.text!,"userID":Auth.auth().currentUser!.uid,"description":self.engDescription.text!,"Work Place":self.engPlace.text!,"contact":self.engcontact.text!,"date" : Date().timeIntervalSinceNow,"image" :  self.uploadImage(self.toBeUploaded!)]
                guard  let idEng = result?.user.uid else {return}
                self.db.collection("Eng").document(idEng).setData(data)
                        print("success")
                    }
          
                }
        performSegue(withIdentifier: "go", sender: self)
            }
        
    func uploadImage(_ image : UIImage) -> Data{
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {return Data()}
        return imageData
    }
    override var prefersStatusBarHidden: Bool {
        return true
      }


}

extension EngSignupViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        myImage.image = pickedImage
        toBeUploaded = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
}





