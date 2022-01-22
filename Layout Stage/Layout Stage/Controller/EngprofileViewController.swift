//
//  EngprofileViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 30/05/1443 AH.
//

import UIKit
import Firebase

class EngprofileViewController: UIViewController {
    var db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var labelNameProfile: UILabel!
    
    @IBOutlet weak var labelEmailProofile: UILabel!
    
    
    @IBOutlet weak var workPlace: UILabel!
    
    
    @IBOutlet weak var workPlaceLabel: UILabel!
    
    
    @IBOutlet weak var project: UIButton!
    
    @IBOutlet weak var contact: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var editprofile: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.layer.cornerRadius = 10

       DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
               
                
                if  ((Auth.auth().currentUser?.email?.contains("@designk")) != nil)   {
                    self.db.collection("Eng")
                    .whereField("userID", isEqualTo: self.userID as Any)
                    .getDocuments { querySnapshot, error in
                        if let error = error{
                            print("wrong read!!")
                            print(error.localizedDescription)
                        }else {
                            guard querySnapshot != nil else{return}
                            for document in querySnapshot!.documents{
                                let data = document.data()
                                print(data["Name"] as? String ?? "")
                                print(data["email"] as? String ?? "")
                                print(data["description"] as? String ?? "")
                                print(data["contact"] as? String ?? "")
                                print(data["Work Place"] as? String ?? "")
                                
                                self.labelNameProfile.text = data["Name"] as? String ?? ""
                                self.labelEmailProofile.text = data["email"] as? String ?? ""
                                self.descriptionText.text = data["description"] as? String ?? ""
                                self.contactLabel.text = data["contact"] as? String ?? ""
                                self.workPlaceLabel.text = data ["Work Place"] as? String ?? ""
                                self.imgProfile.image = UIImage(data: data["image"] as? Data ?? Data())
                                self.labelNameProfile.isHidden = false
                                self.labelEmailProofile.isHidden = false
                                self.descriptionLabel.isHidden = false
                                self.descriptionText.isHidden = false
                                self.workPlace.isHidden = false
                                self.workPlaceLabel.isHidden = false
                                self.contactLabel.isHidden = false
                                self.project.isHidden = false
                                self.contact.isHidden = false
                                self.contactLabel.isHidden = false
                            }
                        }
                    }
                }
            }
       }
        
        
        
        DispatchQueue.global(qos: .userInitiated).async {
             DispatchQueue.main.async {

                          if ((Auth.auth().currentUser?.email?.contains("@gmail")) != nil)   {
                    self.db.collection("Users")
                    .whereField("userID", isEqualTo: self.userID as Any)
                    .getDocuments { querySnapshot, error in
                        if let error = error{
                            print("wrong read!!")
                            print(error.localizedDescription)
                        }else {
                            guard querySnapshot != nil else{return}
                            for document in querySnapshot!.documents{
                                let data = document.data()
                                print(data["Name"] as? String ?? "")
                                print(data["email"] as? String ?? "")
                                self.labelNameProfile.text = data["Name"] as? String ?? ""
                                self.labelEmailProofile.text = data["email"] as? String ?? ""
                                self.labelNameProfile.isHidden = false
                                self.labelEmailProofile.isHidden = false
                                self.descriptionLabel.isHidden = true
                                self.descriptionText.isHidden = true
                                self.workPlace.isHidden = true
                                self.workPlaceLabel.isHidden = true
                                self.contactLabel.isHidden = true
                                self.project.isHidden = true
                                self.contact.isHidden = true
                                self.contactLabel.isHidden = true
                                
                               
                                
                            }
                        }
                    }
                
                              
                          }
             }
        }
        
    
    
    DispatchQueue.global(qos: .userInitiated).async {
         DispatchQueue.main.async {
             if  ((Auth.auth().currentUser?.email?.contains("admin")) != nil)   {
                 self.labelNameProfile.isHidden = true
                 self.labelEmailProofile.isHidden = true
                 self.descriptionLabel.isHidden = true
                 self.descriptionText.isHidden = true
                 self.workPlace.isHidden = true
                 self.workPlaceLabel.isHidden = true
                 self.contactLabel.isHidden = true
                 self.project.isHidden = true
                 self.contact.isHidden = true
                 self.contactLabel.isHidden = true
                 
             }
         }
    }
    }
    @IBAction func projects(_ sender: Any) {
        
        let upload = self.storyboard?.instantiateViewController(withIdentifier: "upload")
        upload!.modalPresentationStyle = .fullScreen
        self.present(upload!, animated: true, completion: nil)

    }
    
    
    @IBAction func logout(_ sender: Any) {
        

        let alert = UIAlertController(title: nil, message: "هل تريد تسجيل الخروج؟", preferredStyle: .alert)
        let action = UIAlertAction(title: "تسجيل الخروج", style: .destructive) {_ in
            do {
                try Auth.auth().signOut()

                let Login = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                Login!.modalPresentationStyle = .fullScreen
                self.present(Login!, animated: true, completion: nil)

            } catch {
                print(error.localizedDescription)

            }

        }
    
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)


    }
    override var prefersStatusBarHidden: Bool {
        return true
      }

    }

