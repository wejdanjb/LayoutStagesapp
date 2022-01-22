//
//  CustomerSignupViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 29/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth
class CustomerSignupViewController: UIViewController {
   
    var state = false
    let db = Firestore.firestore()
    
  
  
    @IBOutlet weak var waitLabel: UILabel!
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var signupName: UITextField!
    
    @IBOutlet weak var signupEmail: UITextField!
    
    @IBOutlet weak var SignupPassword: UITextField!
    
    
    let checkLabel = UILabel()
    
    lazy var isServiceProvider : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        $0.addTarget(self, action: #selector(isProBtnClick), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    @objc func isProBtnClick(){
        if state == false{
            state = true
          isServiceProvider.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
            signup.setTitle("تابع التسجيل", for: .normal)
            
        }
        else{
            state = false
          isServiceProvider.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            signup.setTitle("التسجيل", for: .normal)
        }
      }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isServiceProvider.frame = CGRect(x: 90, y: 645, width: 20, height: 20)
        view.addSubview(isServiceProvider)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        isServiceProvider.tintColor = .black
        checkLabel.frame = CGRect(x: 120, y: 628, width: 250, height: 50)
        checkLabel.text = "او اضغط هنا للتسجيل كمهندس  ←"
        checkLabel.font = UIFont(name: "GillSans-Italic", size: 16)
        checkLabel.textColor = .black
        view.addSubview(checkLabel)
//        Password()
       
    }
    
    ////
//    func Password(){
//
//        if  SignupPassword.text == "" && passConfirm.text == "" {
//            check1.isHidden = true
//            check2.isHidden = true
//
//        }else if SignupPassword.text == passConfirm.text {
//            check1.isHidden = false
//            check2.isHidden = false
//            check1.tintColor = .green
//            check2.tintColor = .green
//        }else if SignupPassword.text != passConfirm.text{
//            check1.isHidden = false
//            check2.isHidden = false
//            check1.tintColor = .red
//            check2.tintColor = .red
//        }else{
//
//        }
//    }
///
    @IBAction func customerSignUp(_ sender: Any) {
      
             if self.state == false {
                 Auth.auth().createUser(withEmail: signupEmail.text!, password: SignupPassword.text!) { [self] result, error in
                     if let error = error{
                         print("error while creating user")
                         print(error.localizedDescription)
                     }else{
                         waitLabel.text = "يتم انشاء الحساب ..."
                    let data : [String: Any] = ["Name":self.signupName.text!,"email":self.signupEmail.text!,"userID":Auth.auth().currentUser!.uid]
                    
                    self.db.collection("Users").addDocument(data: data) { error in
                        if  error == nil {
//                            let tabView = self.storyboard?.instantiateViewController(withIdentifier: "Home") as? UITabBarController
//                            tabView!.modalPresentationStyle = .fullScreen
//                            self.present(tabView!, animated: true, completion: nil)
                        let second = self.storyboard?.instantiateViewController(withIdentifier: "Load")
                        second!.modalPresentationStyle = .fullScreen
                        self.present(second!, animated: true, completion: nil)
                            print("success")
                            
                          
                        }else{
                            print("error while creating user")
                            print(error ?? "")
                        }
                    }
                     }
                 }
                 
                }else if self.state == true{
             
                            let next = self.storyboard?.instantiateViewController(withIdentifier: "next")
                    next!.modalPresentationStyle = .fullScreen
                            self.present(next!, animated: true, completion: nil)
                        }else{
                            print("error while creating Eng")

                        }
                    }
                

    @IBAction func newLogin(_ sender: Any) {
        let Login = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        Login!.modalPresentationStyle = .fullScreen
        self.present(Login!, animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
      }


}


